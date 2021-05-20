import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:taskf1/EventsModel.dart';
import 'package:taskf1/fetchApi.dart';

class MyCalendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyCalendarState();
  }
}

class MyCalendarState extends State {
  CalendarController _controller;


  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    FetchApi fetchApi = FetchApi();

    return TableCalendar(
        initialCalendarFormat: CalendarFormat.month,
        calendarStyle: CalendarStyle(
            todayColor: Colors.orange,
            todayStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            selectedColor: Theme.of(context).primaryColor),
        headerStyle: HeaderStyle(
          formatButtonDecoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20),
          ),
          formatButtonTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          formatButtonShowsNext: false,
        ),
        calendarController: _controller,
        onDaySelected: (DateTime date, List events, List holidays) {
          var myDate = new DateFormat.yMMMMd('en_US').format(date);
          setState(
            () {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return FutureBuilder(
                      future: fetchApi.fetchEvents(),
                      builder: (context, snapshot) {
                        List<EventsModel> events = snapshot.data;

                        if (snapshot.connectionState != ConnectionState.done) {
                          return CircularProgressIndicator();}
                        else{
                        return Container(
                          height: 400,
                          width: 400,
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    myDate.toString(),
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )),
                              Expanded(
                                child: SizedBox(
                                  height: 200.0,
                                  child: ListView.builder(
                                      itemCount: events.length,
                                      itemBuilder: (context, index) {
                                        return Card(
                                            color: Colors.white,
                                            child: Column(children: [
                                              Card(
                                                color: Colors.white60,
                                                child: Container(
                                                  height: 100,
                                                  width: 400,
                                                  padding: EdgeInsets.fromLTRB(
                                                      20.0, 10, 10, 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        ( events[index].mainTitle +" ("+ events[index].time.toString()+":00)"),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        ( events[index].subTitle ),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ]));
                                      }),
                                ),
                              )
                            ],
                          ),
                        );}
                      },
                    );
                  });
            },
          );
        });
  }
}
