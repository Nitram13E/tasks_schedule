import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:tasks_schedule/models/task.dart';

class Day {
  DateTime date;
  final Map<int, Task> _tasks = {};
  final ValueNotifier<List<Task>> tasks = ValueNotifier([]);

  Day({required this.date});

  void addTask({required int id, required Task task}) {
    List<Task> newTasks = [];

    _tasks[id] = task;

    newTasks.addAll(tasks.value);
    newTasks.add(task);
    tasks.value = newTasks;
  }

  void removeTask(Task task) {
    List<Task> taskList = [];

    _tasks.remove(task);

    for (int key = 0; key < _tasks.length; key++) {
      if (_tasks.containsKey(key)) taskList.add(_tasks[key]!);
    }
    tasks.value = taskList;
  }

  Map<String, dynamic> toJson() {
    Map<int, dynamic> tasksJson = <int, dynamic>{};

    _tasks.forEach(
      (key, value) => tasksJson[key] = value.toJson(),
    );

    return {
      "date": formatDate(date, [dd, '/', mm, '/', yyyy]),
      "tasks": tasksJson,
    };
  }
}
