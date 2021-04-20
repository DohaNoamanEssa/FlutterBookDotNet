import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TasksState();
  }
}

class TasksState extends State {
  String str = "";
  final checkBoxList = [
    CheckBoxModel(title: "task flutter"),
    CheckBoxModel(title: "task python"),
    CheckBoxModel(title: "task dot net"),
    CheckBoxModel(title: "free day"),
  ];

  @override
  Widget build(BuildContext context) {
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
    );
  }

  onItemClicked(CheckBoxModel ckbModel) {
    setState(() {
      ckbModel.value = !ckbModel.value;
    });
  }
}

class CheckBoxModel {
  String title;
  bool value ;

  CheckBoxModel({@required this.title, this.value=false});}