import 'package:flutter/material.dart';
import 'package:taskf1/calendar.dart';
import 'package:taskf1/contacts.dart';
import 'package:taskf1/notes.dart';
import 'package:taskf1/tasks.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Book'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 4,
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.blue,
              child: Icon(Icons.add),
            ),
            appBar: AppBar(
              title: Text(widget.title),
              bottom: TabBar(
                tabs: [
                  Tab(text: "Appointment", icon: Icon(Icons.calendar_today)),
                  Tab(text: "Contacts", icon: Icon(Icons.contacts)),
                  Tab(text: "Notes", icon: Icon(Icons.note)),
                  Tab(text: "Tasks", icon: Icon(Icons.check_box)),

                ],
              ),
            ),
            body: TabBarView(children: [
              MyCalendar(),
              Contacts(),
              Notes(),
              Tasks(),
            ])));
  }
}
