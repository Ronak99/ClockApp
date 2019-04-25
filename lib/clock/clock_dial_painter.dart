import 'dart:math';

import 'clock_text.dart';
import 'package:flutter/material.dart';

class ClockDialPainter extends CustomPainter {
  final clockText;

  final hourTickMarkLength = 10.0;
  final minuteTickMarkLength = 5.0;

  final hourTickMarkWidth = 3.0;
  final minuteTickMarkWidth = 1.5;

  final Paint tickPaint;
  final TextPainter textPainter;
  final TextStyle textStyle;

  final double tickLength = 8.0;
  final double tickWidth = 3.0;

  final romanNumeralList = [
    'XII',
    'I',
    'II',
    'III',
    'IV',
    'V',
    'VI',
    'VII',
    'VIII',
    'IX',
    'X',
    'XI'
  ];

  ClockDialPainter({this.clockText = ClockText.roman})
      : tickPaint = new Paint(),
        textPainter = new TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
        textStyle = const TextStyle(
          color: Colors.black,
          fontFamily: 'Times New Roman',
          fontSize: 15.0,
        ) {
    tickPaint.color = Colors.white;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var tickMarkLength;
    final angle = 2 * pi / 60;
    final radius = size.width / 2;
    canvas.save();

    // drawing
    canvas.translate(radius, radius);
    for (var i = 0; i < 60; i++) {
      //make the length and stroke of the tick marker longer and thicker depending
      tickMarkLength = tickLength;
      tickPaint.strokeWidth =
          tickWidth;
      canvas.drawLine(new Offset(0.0, -radius),
          new Offset(0.0, -radius + tickMarkLength), tickPaint);

      canvas.rotate(angle);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
