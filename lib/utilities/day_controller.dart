import 'package:tasks_schedule/models/day.dart';
import 'package:tasks_schedule/utilities/file_controller.dart';

class DayController {
  static final DayController _instance = DayController._internal();
  final Map<DateTime, Day> _days = {};
  FileController fileController = FileController();

  DayController._internal();

  factory DayController() => _instance;

  List<Day> get days => _days.values.toList();

  void loadFromFile() async => fileController.loadFile();

  void saveFile() async {
    
    fileController.writeJson(json);
  }

  void addDay(Day day) => _days[day.date] = day;

  void removeDay(Day day) => _days.remove(day.date);
}
