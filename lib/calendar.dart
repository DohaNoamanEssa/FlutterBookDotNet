import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:date_time_format/date_time_format.dart';

class MyCalendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyCalendarState();
  }
}

class MyCalendarState extends State {
  CalendarController _controller;
  DateTime myDate = DateTime.now();
  bool visibleTF = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController();
  }

  void onDAySelected(DateTime date, List events, List holidays) {
    setState(() {
      visibleTF = true;
      myDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        TableCalendar(
          initialCalendarFormat: CalendarFormat.month,
          calendarStyle: CalendarStyle(
              todayColor: Colors.orange,
              todayStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              selectedColor: Theme
                  .of(context)
                  .primaryColor),
          headerStyle: HeaderStyle(
            formatButtonDecoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            formatButtonTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            formatButtonShowsNext: false,
          ),
          calendarController: _controller,
          onDaySelected: onDAySelected,
        ),
        Positioned(
          top: 250,
          bottom: 0,
          left: 0,
          right: 0,
          child: Visibility(
              visible: visibleTF,
              child: Card(
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "$myDate",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                      ),
                    ),
                    Card(
                      color: Colors.white60,
                      child: Container(
                        height: 100,
                        width: 400,
                        padding: EdgeInsets.fromLTRB(20.0, 10, 10, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Haircut(2:40 PM)",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "It's getting too long ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white60,
                      child: Container(
                        height: 100,
                        width: 400,
                        padding: EdgeInsets.fromLTRB(20.0, 10, 10, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Collect ransom(12:00 PM)",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "... or else ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),)
      ],
    );
  }
}
