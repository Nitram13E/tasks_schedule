import 'dart:convert';

import 'package:tasks_schedule/models/day.dart';
import 'package:tasks_schedule/utilities/file_controller.dart';

class DaysController {
  static final DaysController _instance = DaysController._internal();
  final Map<DateTime, Day> _days = <DateTime, Day>{};
  FileController fileController = FileController();

  DaysController._internal();

  factory DaysController() => _instance;

  List<Day> get days => _days.values.toList();

  void addDay(Day day) => _days[day.date] = day;

  void removeDay(Day day) => _days.remove(day.date);

  void loadFromFile() async {
    fileController.loadFile();
    String? fileContent = fileController.file?.readAsStringSync();

    if (fileContent != null) jsonDecode(fileContent);
  }

  void saveFile() async {
    Map<String, dynamic> fileJson = <String, dynamic>{};

    _days.forEach(
      (key, value) => fileJson[key.toString()] = value.toJson(),
    );

    fileController.writeJson(fileJson);
  }
}
