class Task {
  int id;
  String? name;
  String? description;
  DateTime time;
  bool? loaded;

  Task({required this.id, this.name, required this.time, this.loaded}) {
    name = '';
    loaded = false;
  }
}
