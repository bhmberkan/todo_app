import 'dart:convert';


import 'package:todo_app/model/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  final String url = "https://dummyjson.com/todos/";

  Future<List<Todo>> getUncompletedTodos() async{
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];
    List<Todo> todos = List.empty(growable: true);

    resp.forEach((Element){
      Todo task = Todo.fromJson(Element);
      
      if (task.completed! == false) {
        todos.add(task);
      }

     
    });


    return todos;
  }

 Future<List<Todo>> getcompletedTodos() async{
    final response = await http.get(Uri.parse(url));
    List<dynamic> resp = jsonDecode(response.body)["todos"];
    List<Todo> todos = List.empty(growable: true);

    resp.forEach((Element){
      Todo task = Todo.fromJson(Element);
      
      if (task.completed! == true) {
        todos.add(task);
      }

     
    });


    return todos;
  }





}