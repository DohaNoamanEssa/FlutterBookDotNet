import 'package:flutter/material.dart';

class Notes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NotesState();
  }
}

class NotesState extends State {

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(
          width: 10,
          height: 10,
        ),
        Card(
          elevation: 20.0,
          color: Colors.white60,
          child: Container(
            height: 100,
            width: 350,
            padding: EdgeInsets.fromLTRB(20.0, 10, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ahmed Essa ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Eng Ahmed Elsaeed Essa ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
          height: 10,
        ),
        Card(
          elevation: 20.0,
          color: Colors.red,
          child: Container(
            height: 100,
            width: 350,
            padding: EdgeInsets.fromLTRB(20.0, 10, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Adam Essa ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Dr Adam Ahmed Essa ",
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
    );
  }
}




