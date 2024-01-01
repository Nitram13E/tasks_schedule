import 'package:flutter_quill/flutter_quill.dart';

class Task {
  final int id;
  late String name;
  Delta? description;
  late Duration totalTime;
  late bool loaded;

  Task({required this.id, String? name, List<dynamic>? description, Duration? totalTime, bool? loaded}) {
    this.name = name ?? '';
    if (description != null) this.description = Delta.fromJson(description);
    this.totalTime = totalTime ?? Duration.zero;
    this.loaded = loaded ?? false;
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    List<String> totalTime = json["totalTime"].toString().split(':');
    return Task(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      totalTime: Duration(
        hours: int.parse(totalTime.first),
        minutes: int.parse(totalTime.elementAt(1)),
      ),
      loaded: json["loaded"],
    );
  }

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
        "description": description ?? description!.toJson(),
        "totalTime": totalTime.toString(),
        "loaded": loaded,
      };
}
