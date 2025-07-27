import 'package:flutter/material.dart';

void main(){
  runApp(new myApp());
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 50.0,
                    height: 50.0,
                    color: Colors.red,
                    child: Center(child: Text("kotak 1"),)
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    color: Colors.yellow,
                    child: Center(child: Text("kotak 2"),)
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    color: Colors.purple,
                    child: Center(child: Text("kotak 3"),)
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width:50.0,
                    height:50.0,
                    color: Colors.green,
                    child: Center(child: Text("kotak 4"),)
                  ),
                  Container(
                    width:50.0,
                    height:50.0,
                    color: Colors.indigo,
                    child: Center(child: Text("kotak 5"),)
                  ),
                  Container(
                    width:50.0,
                    height:50.0,
                    color: Colors.greenAccent,
                    child: Center(child: Text("kotak 6"),)
                  ),
                ]
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width:50.0,
                    height:50.0,
                    color: Colors.amber,
                    child: Center(child: Text("kotak 7"),)
                  ),
                  Container(
                    width:50.0,
                    height:50.0,
                    color: Colors.teal,
                    child: Center(child: Text("kotak 8"),)
                  ),
                  Container(
                    width:50.0,
                    height:50.0,
                    color: Colors.pink,
                    child: Center(child: Text("kotak 9"),)
                  ),
                ]
              )
            ],
          ),
        )

      )
    );
  }

}

// jdai column itu unntuk vertikal, dan row untuk horizontal

// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.center,

// jadi kalo row, cross itu untuk vertikal
// dan main itu untuk horizontal

// nah kalo colunm, cross itu untuk horizontal
// dan main itu untuk vertikal