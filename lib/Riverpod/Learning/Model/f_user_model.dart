// To parse this JSON data, do
//
//     final fuUser = fuUserFromJson(jsonString);

import 'dart:convert';

FuUser fuUserFromJson(String str) => FuUser.fromJson(json.decode(str));

String fuUserToJson(FuUser data) => json.encode(data.toJson());

class FuUser {
  List<Todo> todos;
  int total;
  int skip;
  int limit;

  FuUser({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory FuUser.fromJson(Map<String, dynamic> json) => FuUser(
    todos: List<Todo>.from(json["todos"].map((x) => Todo.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "todos": List<dynamic>.from(todos.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Todo {
  int id;
  String todo;
  bool completed;
  int userId;

  Todo({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json["id"],
    todo: json["todo"],
    completed: json["completed"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "todo": todo,
    "completed": completed,
    "userId": userId,
  };
}