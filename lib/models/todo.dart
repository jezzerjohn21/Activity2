class Todo {
  final String title;
  final bool isFinished;

  Todo({
    required this.title,
    required this.isFinished,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      isFinished: json['isFinished'],
    );
  }
}
