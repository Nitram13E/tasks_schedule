import 'dart:collection';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:tasks_schedule/models/task.dart';

class Day extends ChangeNotifier {
  final DateTime date;
  final ValueNotifier<double> tasksTime = ValueNotifier(0);
  final ValueNotifier<double> loadedTasksTime = ValueNotifier(0);
  final ValueNotifier<int> loadedTasks = ValueNotifier(0);

  final ValueNotifier<LinkedHashMap<int, Task>> tasks = ValueNotifier(LinkedHashMap());

  Day({required this.date});

  void addTask({required Task task}) {
    tasks.value[task.id] = task;

    tasks.notifyListeners();
  }

  void removeTask(Task task) {
    tasksTime.value -= (tasks.value[task.id]!.totalTime.inMinutes / 60);

    tasks.value.remove(task.id);
  }

  @override
  String toString() {
    String day = '$date';

    for (Task task in tasks.value.values) {
      day += '$task | ';
    }

    return day;
  }

  Map<String, dynamic> toJson() {
    Map<int, dynamic> tasksJson = <int, dynamic>{};

    tasks.value.forEach(
      (key, value) => tasksJson[key] = value.toJson(),
    );

    return {
      "date": formatDate(date, [dd, '/', mm, '/', yyyy]),
      "tasks": tasksJson,
    };
  }
}
