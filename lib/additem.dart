import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'todo.dart';

class AddItemPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  TextEditingController titleController = new TextEditingController();
  TextEditingController contentController = new TextEditingController();
    var body = Padding(
        padding: EdgeInsets.all(20),
        child : Column(
              mainAxisAlignment : MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: TextField(
                    controller: titleController,
                    autofocus: true,
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Input Title',
                  ),
                ),
                ),
                Flexible(
                  child:
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    height: 30 * 24.0,
                    child : TextField(
                     
                     maxLines: 30,
                     controller: contentController,
                     decoration: InputDecoration(
                     border: OutlineInputBorder(),
                     labelText: 'Input Content',
                    ),
                  ),
                  )
                ), 
                )
          ],
        )
      );

    void _SendInfo(){
      debugPrint("click");
      final String encodedTodos = Todo.encodeTodos([Todo(title : titleController.text,subTitle : contentController.text)]);
      debugPrint("encodedTodos : $encodedTodos");
      Todo todos = Todo(title : titleController.text,subTitle : contentController.text);
      Navigator.of(context).pop({"todo" : todos});
    }

    return Scaffold(
      appBar: AppBar(
        title : Text("AddTodo")
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
                    onPressed:_SendInfo,
                    tooltip: 'Add ToDo',
                    child: Icon(Icons.send),
                ));
  }
}
