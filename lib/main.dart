import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_todo/additem.dart';
import 'package:flutter_todo/viewtodo.dart';
import 'todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title});
  
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Todo> _items = [];
  SharedPreferences _prefs;

  @override initState(){
     super.initState();
     _loadTodo();
  }

  void _loadTodo() async{
    _prefs = await SharedPreferences.getInstance();
     final String stringValue = _prefs.getString("todos");
     setState(() {
       _items = Todo.decodeTodos(stringValue);
     });
  }

  void _saveTodo(List<Todo> list){
    String json = Todo.encodeTodos(list);
    _prefs.setString("todos",json);
  }

  void _addTodoItem(String title,String subTitle) {
    setState(() {
      _items.add(Todo(title : title,subTitle: subTitle));
      _saveTodo(_items);
    });
  }

  void _addItemScreen() async{
    Map result = await Navigator.of(context).push(new MaterialPageRoute(
      builder: (BuildContext context) {
        return AddItemPage();
      }
    ));
    
    if(result != null && result.containsKey("todo")){
       Todo todos = result["todo"];
      _addTodoItem(todos.title,todos.subTitle);
    }
  }

  void _addViewItemScreen(String title,String subTitle) async{
    await Navigator.of(context).push(new MaterialPageRoute(
      builder: (BuildContext context) {
        return ViewTodoPage(title,subTitle);
    }));
  }

  Widget _buildToDoList(){
    return new ListView.builder(
      itemBuilder: (context,index){
        if(index < _items?.length){
          var items = _items[index];
          return _todoItem(items.title,items.subTitle);
        }
    });
  }

  Widget _todoItem(String title,String subTitle){
    return new ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      onTap: () => _addViewItemScreen(title,subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo"),
      ),
      body: Container(
        padding: EdgeInsets.zero,
        child : _buildToDoList()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addItemScreen(),
        tooltip: 'Add ToDo',
        child: Icon(Icons.add),
      ), 
      
    );
  }
}
