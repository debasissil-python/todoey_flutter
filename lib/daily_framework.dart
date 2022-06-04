import 'package:flutter/material.dart';

class DailYFramework {
  static const createdTime = 'createdTime';
}

class DailY {
  late DateTime createdTime;
  late String title;
  late String description;
  late String id;
  late bool isDone;

  DailY({
    required this.createdTime,
    required this.title,
    this.description = '',
    this.id = '',
    this.isDone = false,
  });
}
