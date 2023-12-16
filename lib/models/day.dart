import 'dart:collection';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:tasks_schedule/models/task.dart';

class Day extends ChangeNotifier {
  DateTime date;
  final ValueNotifier<LinkedHashMap<int, Task>> tasks = ValueNotifier(LinkedHashMap());

  Day({required this.date});

  void addTask({required Task task}) {
    tasks.value[task.id] = task;

    tasks.notifyListeners();
  }

  void updateTask({required Task task}) {
    tasks.value[task.id] = task;

    tasks.notifyListeners();
  }

  void removeTask(Task task) => tasks.value.remove(task.id);

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
