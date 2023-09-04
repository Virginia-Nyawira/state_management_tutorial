import 'dart:convert';

import 'package:states/Provider/API_Call_using_Provider/Model/to_do.dart';

import 'package:http/http.dart' as http;

class ToDoService {
  Future<List<ToDo>> getAll() async {
    const url = 'https:/jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

//Confirming if the response is good
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;

      final todos = json
          .map((e) => ToDo(
              userId: e['userId'],
              id: e['id'],
              title: e['title'],
              completed: e['completed']))
          .toList();
      return todos;
    } else {
//  return [];
      throw 'Something went wrong';
    }
  }
}
