import 'package:flutter/material.dart';
import 'package:taskf1/TasksModel.dart';
import 'fetchApi.dart';

class Tasks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TasksState();
  }
}

class TasksState extends State {
  @override
  Widget build(BuildContext context) {
    FetchApi fetchApi = FetchApi();
    return FutureBuilder(
        future: fetchApi.fetchTasks(),
        builder: (context, snapchot) {
          List<TasksModel> tasks = snapchot.data;
          if (snapchot.connectionState != ConnectionState.done) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    checkColor: Colors.white,
                    title: Text(
                      tasks[index].task.toString(),
                      style: TextStyle(color: Colors.blue,
                      fontSize: 25),
                    ),
                    value: tasks[index].checked,
                  );
                });
          }
        });
  }

/*onItemClicked(TasksModel task) {
    setState(() {
      task.checked = !task.checked;
    });
  }*/
}

/*class CheckBoxModel {
  String title;
  bool value ;

  CheckBoxModel({@required this.title, this.value=false});}*/

/*
return ListView(
children: [
Divider(),
...
checkBoxList
    .map(
(item) => ListTile(
onTap: () {
onItemClicked(item);

},
title: Text(
item.title,
style: TextStyle(
fontSize: 20,
color: Colors.black,
fontWeight: FontWeight.normal),
),
subtitle: Text(item.title+" this week"),
leading: Checkbox(
value: item.value,
onChanged: (value) {
onItemClicked(item);
},
),
),
).toList()
],
);*/

/*/*
ListView(
                    children: [
                      Divider(),
                      ...
                      tasks.map(
                            (item) => ListTile(
                          onTap: () {
                            onItemClicked(item);

                          },
                          title: Text(
                            tasks[index].task,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          subtitle: Text(tasks[index].task+"this week"),
                          leading: Checkbox(
                            value: tasks[index].checked,
                            onChanged: (value) {
                              onItemClicked(item);
                            },
                          ),
                        ),
                      ).toList()
                    ],
                  )
*/*/
