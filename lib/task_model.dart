class TaskModel {
  String id;
  String title;
  String description;
  bool isDone;
  int date;
  String userId;

  TaskModel({
    this.id = '',
    required this.title,
    required this.description,
    required this.date,
    this.isDone = false,
    required this.userId,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title'],
          description: json['description'],
          date: json['date'],
          isDone: json['isDone'],
          id: json['id'],
          userId: json['userId'],
        );

  // TaskModel fromJson(Map<String, dynamic> json) {
  //   return TaskModel(
  //     title: json['title'],
  //     description: json['description'],
  //     date: json['date'],
  //     isDone: json['isDone'],
  //     id: json['id'],
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "title": title,
      "id": id,
      "isDone": isDone,
      "date": date,
      "userId": userId,
    };
  }
}
