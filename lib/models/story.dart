import 'package:flutter/material.dart';

class Story {
  final String user;
  final String time;
  final String text;
  final IconData icon;
  final List<Color> colors;
  bool seen;

  Story({
    required this.user,
    required this.time,
    required this.text,
    required this.icon,
    required this.colors,
    this.seen = false,
  });
}
