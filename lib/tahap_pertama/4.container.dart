import 'package:flutter/material.dart';


void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ini adalah AppBar"),
        ),
        body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              Container(
                width:300.0,
                height: 300.0,
                color: Colors.amber,
                
              )
            ]
          )
        )
      )
    );
  }
}