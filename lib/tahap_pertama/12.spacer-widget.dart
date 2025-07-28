import 'package:flutter/material.dart';

void main(){
  runApp(new MyApp());
}


class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:Text("ini adalah appbar")),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.green,
              ]
              )
          ),
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: Column(
                children: [
                  Flexible( // ini juga bisa ga pake flesible
                  // yang penting parentnya itu adalah column atau row
                    flex: 2,
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      color: const Color.fromARGB(255, 33, 69, 99),
                      child: Center(
                        child: Text("Ini adalah Flexible + Align",
                        textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  // disini kita bisa tambahkan space
                  Spacer(flex: 1,),
                  Flexible(
                    flex:2,
                    child: Container(
                      width: 200.0,
                      height: 200.0,                  
                      color: const Color.fromARGB(255, 163, 23, 72),
                      child: Center(
                        child: Text("Ini adalah Flexible + Align",
                        textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Spacer(flex: 1,),
                  Flexible(
                    flex:2,
                    child: Container(
                      width: 200.0,
                      height: 200.0,                  
                      color: const Color.fromARGB(255, 36, 62, 20),
                      child: Center(
                        child: Text("Ini adalah Flexible + Align",
                        textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      )
    );

  }
  
}

// nah jadi spacer ini ga akan berbengruh, pada pembungkus selain
// Row
// Column
// atau Flex itu sendiri