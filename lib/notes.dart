import 'package:flutter/material.dart';
import 'package:taskf1/NotesModel.dart';

import 'fetchApi.dart';

class Notes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NotesState();
  }
}

class NotesState extends State {

  @override
  Widget build(BuildContext context) {
    FetchApi fetchApi = FetchApi();
    return FutureBuilder(
        future: fetchApi.fetchNotes(),
        builder: (context, snapchot) {
          List<NotesModel> notes = snapchot.data;
          if (snapchot.connectionState != ConnectionState.done) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        width: 10,
                        height: 20,
                      ),
                      Card(
                        elevation: 20.0,
                        color: Colors.white70,
                        child: Container(
                          height: 100,
                          width: 350,
                          padding: EdgeInsets.fromLTRB(20.0, 10, 10, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notes[index].title.toString(),
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),

                              Text(
                                notes[index].content.toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  );
                });
          }
        });
  }
}

/*Column(
children: [
SizedBox(
width: 10,
height: 20,
),
Card(
elevation: 20.0,
color: Colors.yellow,
child: Container(
height: 100,
width: 350,
padding: EdgeInsets.fromLTRB(20.0, 10, 10, 10),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
"Doha Noaman ",
style: TextStyle(
color: Colors.black,
fontSize: 17,
fontWeight: FontWeight.bold),
),

Text(
"Eng Doha Noaman Essa ",
style: TextStyle(
color: Colors.black,
fontSize: 15,
),
),
],
),
),
),

],
)*/




