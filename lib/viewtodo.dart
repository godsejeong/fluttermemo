import 'package:flutter/material.dart';

class ViewTodoPage extends StatelessWidget{
  String title,subTitle;

  ViewTodoPage(title,subTitle){
    this.title = title;
    this.subTitle = subTitle;
  }
  @override
  Widget build(BuildContext context) {
    var body = Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment : MainAxisAlignment.start,
        children: <Widget>[
           Container(
             width: double.infinity,
             padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(
                  Radius.circular(5.0)
              ),
            ),
              child: new Text(
                "$title",
                textAlign: TextAlign.left,
                style: new TextStyle(
                fontSize: 20.0,
                color: Colors.black,
               ),
             ),
           ),
           Flexible(
             child: 
           Container(
             height: double.infinity,
             width: double.infinity,
             padding: EdgeInsets.all(20),
             decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(
                  Radius.circular(5.0)
              ),
            ),
             margin: EdgeInsets.only(top : 10),
             child: SizedBox( 
               height: 100,
               child : Text(
               "$subTitle",
                textAlign: TextAlign.left,
                style: new TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                ),
              ),
             )
           ),
           ),
        ],
      )
    );

    return Scaffold(
      appBar: AppBar(
        title : Text("ViewMemo")
      ),
      body: body,
    );
  }
  
}