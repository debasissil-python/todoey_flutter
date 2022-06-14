import 'package:flutter/material.dart';
import 'package:todoey_flutter/daily_framework.dart';

class DailYProvider extends ChangeNotifier {
  final List<DailYFrames> _dailys = [
    DailYFrames(
      createdTime: DateTime.now(),
      title: 'Walk the Dog',
    ),
    DailYFrames(
      createdTime: DateTime.now(),
      title: 'Walk the Lady',
    ),
    DailYFrames(
      createdTime: DateTime.now(),
      title: 'Give Time to Family',
    ),
    DailYFrames(
        createdTime: DateTime.now(),
        title: 'Love All',
        description:
            'Hallo I am Debasis Sil. I would like you to know that I would like to get her in my life'),
  ];

  List<DailYFrames> get dailys =>
      _dailys.where((daily) => daily.isDone == false).toList();

  List<DailYFrames> get dailysCompleted =>
      _dailys.where((daily) => daily.isDone == true).toList();

  void addDaily(DailYFrames todo) {
    _dailys.add(todo);

    notifyListeners();
  }

  void removeDaily(DailYFrames todo) {
    _dailys.remove(todo);

    notifyListeners();
  }

  bool toggleDailyStatus(DailYFrames todo) {
    todo.isDone = !todo.isDone;

    notifyListeners();

    return todo.isDone;
  }

  void updateDaily(DailYFrames todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}
