class Task {
  String id;
  String description;
  String title;
  bool isDon;
  String time;

  Task({
    required this.id,
    required this.description,
    required this.title,
    required this.isDon,
    required this.time,
  });

  factory Task.fromMap(Map<String, dynamic> data) {
    return Task(
      id: data['id'],
      description: data['description'],
      title: data['title'],
      isDon: data['isDon'],
      time: data['time'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'title': title,
      'isDon': isDon,
      'time': time,
    };
  }
}