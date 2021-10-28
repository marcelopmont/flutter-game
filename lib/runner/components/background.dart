import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Background {

  final backgroundPaint = Paint()..color = Colors.lightBlue;

  void render(Canvas canvas) {
    canvas.drawPaint(backgroundPaint);
  }

}