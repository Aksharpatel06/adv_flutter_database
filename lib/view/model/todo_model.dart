class TodoModel {
  String title, discription, priority;
  int isDone,id;

  TodoModel._(
      {required this.title,
        required this.id,
      required this.discription,
      required this.isDone,
      required this.priority});

  factory TodoModel(Map json) {
    return TodoModel._(
      id: json['id'],
        title: json['title'],
        discription: json['subtitle'],
        isDone: json['isDone'],
        priority: json['priority']);
  }
}
