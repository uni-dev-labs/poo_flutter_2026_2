import 'package:flutter/material.dart';

class Post {
  final String user;
  final bool verified;
  final String caption;
  final String time;
  final IconData icon;
  final List<Color> colors;
  final String imageUrl;
  int likes;
  bool liked;
  bool saved;
  final List<String> comments;

  Post({
    required this.user,
    required this.caption,
    required this.time,
    required this.icon,
    required this.colors,
    required this.imageUrl,
    this.verified = false,
    this.likes = 0,
    this.liked = false,
    this.saved = false,
    List<String>? comments,
  }) : comments = comments ?? [];
}
