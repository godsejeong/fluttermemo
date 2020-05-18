import 'package:flutter/material.dart';
import 'package:flutter_todo/additem.dart';
import 'todo.dart';

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

  void _addTodoItem(String title,String subTitle) {
    setState(() {
      _items.add(Todo(title,subTitle));
    });
  }

  void _addItemScreen() async{
    Map result = await Navigator.of(context).push(new MaterialPageRoute(
      builder: (BuildContext context) {
        return AddItemPage();
      }
    ));

    if(result != null && result.containsKey("todo")){
      Todo todo = result["todo"] as Todo;
      _addTodoItem(todo.title,todo.subTtile);
    }
  }

  Widget _buildToDoList(){
    return new ListView.builder(
      itemBuilder: (context,index){
        if(index < _items?.length){
          var items = _items[index];
          return _todoItem(items.title,items.subTtile);
        }
    });
  }

  Widget _todoItem(String title,String subTitle){
    return new ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
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
