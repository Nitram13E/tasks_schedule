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

  Day({required this.date, double? tasksTime, double? loadedTasksTime, int? loadedTasks, Map<int, Task>? tasks}) {
    this.tasksTime.value = tasksTime ?? 0;
    this.loadedTasksTime.value = loadedTasksTime ?? 0;
    this.loadedTasks.value = loadedTasks ?? 0;
    if (tasks != null) this.tasks.value.addAll(tasks);
  }

  factory Day.fromJson({required Map<String, dynamic> json}) {
    Map<int, Task> tasks = {};

    for (Map<String, dynamic> taskJson in json["tasks"]) {
      tasks[taskJson["id"]] = Task.fromJson(taskJson);
    }

    return Day(
      date: DateTime.parse(json["date"]),
      tasksTime: json["tasks_time"],
      loadedTasksTime: json["loaded_tasks_time"],
      loadedTasks: json["loaded_tasks"],
      tasks: tasks,
    );
  }

  void addTask({required Task task}) {
    tasks.value[task.id] = task;

    tasks.notifyListeners();
  }

  void removeTask(Task task) {
    tasksTime.value -= (tasks.value[task.id]!.totalTime.inMinutes / 60);

    if (task.loaded) {
      loadedTasksTime.value -= (tasks.value[task.id]!.totalTime.inMinutes / 60);
      loadedTasks.value--;
    }

    tasks.value.remove(task.id);
    tasks.notifyListeners();
  }

  String tasksToString() {
    String result = '';

    for (Task task in tasks.value.values) {
      result += '$task';
    }

    return result;
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
    List<Map<String, dynamic>> tasksJson = [];

    for (Task task in tasks.value.values) {
      tasksJson.add(task.toJson());
    }

    return {
      "date": formatDate(date, [yyyy, '-', mm, '-', dd]),
      "tasks_time": tasksTime.value,
      "loaded_tasks_time": loadedTasksTime.value,
      "loaded_tasks": loadedTasks.value,
      "tasks": tasksJson,
    };
  }
}
