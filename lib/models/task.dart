class Task {
  int id;
  String? name;
  String? description;
  DateTime totalTime;
  bool? loaded;

  Task({required this.id, this.name, required this.totalTime, this.loaded}) {
    name = '';
    loaded = false;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "totalTime": totalTime.toString(),
        "loaded": loaded,
      };
}
