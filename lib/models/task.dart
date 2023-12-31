import 'package:flutter_quill/flutter_quill.dart';

class Task {
  final int id;
  String name = '';
  Delta? description;
  late Duration totalTime = Duration.zero;
  bool loaded = false;

  Task({required this.id});

  set setHours(int newHours) => totalTime = Duration(
        hours: newHours,
        minutes: minutes,
      );

  set setMinutes(int newMinutes) => totalTime = Duration(
        hours: hours,
        minutes: newMinutes,
      );

  get hours => totalTime.inHours;

  get minutes => totalTime.inMinutes % 60;

  @override
  String toString() {
    return description != null ? ' - $name: ${description!.first.value.replaceAll(RegExp(r'insert'), '')}' : '';
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description != null ? description!.toJson() : description,
        "totalTime": totalTime.toString(),
        "loaded": loaded,
      };
}
