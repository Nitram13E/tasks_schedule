import 'package:flutter/material.dart';
import 'package:tasks_schedule/models/day.dart';

class DaysController extends ChangeNotifier {
  static final DaysController _instance = DaysController._internal();

  DaysController._internal();
  factory DaysController() => _instance;

  final ValueNotifier<Map<DateTime, Day>> days = ValueNotifier(<DateTime, Day>{});
  final ValueNotifier<Day?> selectedDay = ValueNotifier(null);
  final List<Day> history = [];

  List<Day> get dayList => days.value.values.toList();

  void addDay(Day day) {
    days.value[day.date] = day;
    selectDay(day);
  }

  void removeDay(Day day) {
    goTopreviousDay();
    history.removeWhere((element) => element.date == day.date);

    days.value.remove(day.date);
    days.notifyListeners();
  }

  void selectDay(Day day) {
    selectedDay.value = day;
    history.add(day);
  }

  void goTopreviousDay() {
    int previousDayIndex = history.indexOf(selectedDay.value!) - 1;

    if (previousDayIndex >= 0) selectedDay.value = history.elementAt(previousDayIndex);
  }

  void goToNextDay() {
    int nextDayIndex = history.indexOf(selectedDay.value!) + 1;

    if (nextDayIndex < history.length) selectedDay.value = history.elementAt(nextDayIndex);
  }

  void loadfromJson({required Map<String, dynamic> json}) {
    selectedDay.value = null;
    history.clear();

    Map<DateTime, Day> newDays = {};

    for (Map<String, dynamic> dayJson in json['days']) {
      newDays[DateTime.parse(dayJson["date"])] = Day.fromJson(json: dayJson);
    }

    days.value = newDays;
    selectDay(days.value.values.first);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> daysJson = [];

    for (Day day in dayList) {
      daysJson.add(day.toJson());
    }

    return {'days': daysJson};
  }
}
