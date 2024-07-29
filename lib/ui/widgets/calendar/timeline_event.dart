import 'package:flutter/material.dart';

class TimelineEvent {
  final DateTime startTime;
  final DateTime endTime;
  final String title;
  final Color color1;
  final Color color2;

  TimelineEvent({
    required this.startTime,
    required this.endTime,
    required this.title,
    required this.color1,
    required this.color2,
  });
}