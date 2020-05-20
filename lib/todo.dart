import 'dart:convert';
import 'package:flutter/cupertino.dart';

class Todo{
  final String title;
  final String subTitle;

  Todo({this.title,this.subTitle});
  
  static Map<String, dynamic> toMap(Todo todo) => {
    'title': todo.title,
    'subTitle': todo.subTitle
  };     

  factory Todo.fromJson(Map<String, dynamic> jsonData) {
      return Todo(
        title : jsonData['title'],
        subTitle : jsonData['subTitle'],
      );
  }   

  static String encodeTodos(List<Todo> todos) => json.encode(
      todos
          .map<Map<String, dynamic>>((item) => Todo.toMap(item))
          .toList(),
   );

   static List<Todo> decodeTodos(String todos) {
      debugPrint(todos);
      List<Todo> item = (json.decode(todos) as List<dynamic>)
          .map<Todo>((item) => Todo.fromJson(item))
          .toList();
      item.forEach((it) => debugPrint("title : ${it.title} subTitle : ${it.subTitle}"));
     
      return item;
   }
}