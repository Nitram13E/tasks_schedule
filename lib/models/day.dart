import 'package:tasks_schedule/models/task.dart';

class Day {
  DateTime date;
  Map<int, Task> tasks = {};

  Day({required this.date});

  void addTask({required int id, required Task task}) => tasks[id] = task;

  void removeTask(Task task) => tasks.remove(task);

  Map<String, dynamic> toJson() {
    Map<int, dynamic> tasksJson = <int, dynamic>{};

    tasks.forEach(
      (key, value) => tasksJson[key] = value.toJson(),
    );

    return {
      "date": date,
      "tasks": tasksJson,
    };
  }
}
