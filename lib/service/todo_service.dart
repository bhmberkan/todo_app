import 'dart:convert';

import 'package:todo_app/model/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  final String url = "https://dummyjson.com/todos/";
  final String addurl = "https://dummyjson.com/todos/add";

  Future<List<Todo>> getUncompletedTodos() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];
    List<Todo> todos = List.empty(growable: true);

    resp.forEach((Element) {
      Todo task = Todo.fromJson(Element);

      if (task.completed! == false) {
        todos.add(task);
      }
    });

    return todos;
  }

  Future<List<Todo>> getcompletedTodos() async {
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];
    List<Todo> todos = List.empty(growable: true);

    resp.forEach((Element) {
      Todo task = Todo.fromJson(Element);

      if (task.completed! == true) {
        todos.add(task);
      }
    });

    return todos;
  }

  Future<String> addTodo(Todo newTodo) async {
    final response = await http.post(
      Uri.parse(addurl),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: json.encode(newTodo.toJson()),
    );
    print(response.body);
    return response.body;
  }
}
