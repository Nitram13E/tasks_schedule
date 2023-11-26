class Task {
  final int id;
  String? name;
  String? description;
  late Duration totalTime;
  bool? loaded;

  Task({required this.id, this.name, this.loaded}) {
    name = '';
    totalTime = Duration.zero;
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
