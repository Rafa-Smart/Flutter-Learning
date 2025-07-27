// flex: 1, flex: 2, flex: 3 artinya proporsi lebar masing-masing widget adalah 1:2:3.

// Misal total lebar layar adalah 600px, maka:

// Merah = 1/6 × 600 = 100 px

// Hijau = 2/6 × 600 = 200 px

// Biru = 3/6 × 600 = 300 px

import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
           title: Text(
             "ini adalah flexible",
             style: TextStyle(
               fontSize: 20,
               fontWeight: FontWeight.bold,
               color: Colors.white,
             ),
           )
        ),
        body: Center(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 3, 155, 186),
              ),
              child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            color: Colors.red,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            color: Colors.green,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      color: const Color.fromARGB(255, 59, 13, 156),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          )
        )
      )
    );
  }
}