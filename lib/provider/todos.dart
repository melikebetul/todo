
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';


class TodosProvider extends ChangeNotifier{
  List<Todo> _todos=[
    Todo(
      createdTime: DateTime.now(), 
      title: 'Walk the Dog',
    ),
    Todo(
      createdTime: DateTime.now(), 
      title: 'Run',
      isDone: true,
    ),
    Todo(
      createdTime: DateTime.now(), 
      title: 'Plan a trip',
    ),
    Todo(
      createdTime: DateTime.now(), 
      title: 'Walk the Dog',
    ),
    Todo(
      createdTime: DateTime.now(), 
      title: 'Run',
    ),
    Todo(
      createdTime: DateTime.now(), 
      title: 'Plan a trip',
    ),
  ];
  
  List<Todo> get todos => _todos.where((todo)=> todo.isDone==false).toList();
  List<Todo> get todosCompleted => _todos.where((todo)=> todo.isDone==true).toList();

  void addtodo(Todo todo){
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo){
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo){
    print(todo.isDone);
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }
  void updateTodo(Todo todo, String title, String description){
    todo.title=title;
    todo.description=description;
    notifyListeners();
  }
  
}

