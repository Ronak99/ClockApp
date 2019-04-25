import 'dart:async';

import 'hand_hour.dart';
import 'hand_minute.dart';
import 'hand_second.dart';
import 'package:flutter/material.dart';



class ClockHands extends StatelessWidget {
  final DateTime dateTime;
  final bool showHourHandleHeartShape;

  ClockHands({this.dateTime, this.showHourHandleHeartShape = false});

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
        aspectRatio: 1.0,
        child: new Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            child: new Stack(
                fit: StackFit.expand, 
                children: <Widget>[
                  new CustomPaint(painter: new HourHandPainter(
                      hours: dateTime.hour, minutes: dateTime.minute),
                  ),
                  new CustomPaint(painter: new MinuteHandPainter(
                      minutes: dateTime.minute, seconds: dateTime.second),
                  ),
                  new CustomPaint(painter: new SecondHandPainter(seconds: dateTime.second),
                  ),
                ]
            )
        )

    );
  }
}

//class _ClockHandState extends State<ClockHands> {
  Timer _timer;
//
//  _ClockHandState();
//
//  @override
//  void initState() {
//    super.initState();
//    dateTime = new DateTime.now();
//    _timer = new Timer.periodic(const Duration(seconds: 1), setTime);
//  }
//
//  void setTime(Timer timer) {
//    setState(() {
//      dateTime = new DateTime.now();
//    });
//  }
//
//  @override
//  void dispose() {
//    _timer.cancel();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//  }
//}

