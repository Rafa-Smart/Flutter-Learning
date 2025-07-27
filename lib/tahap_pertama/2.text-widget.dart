import 'package:flutter/material.dart';

void main(){
  runApp(new myApp());
}

// jadi stateless widgt ini adalah class yang abstrak
// yang wjib di oeverride si method buildnya di class childnya

// kita harus override si method build, karena dia abstrak, dan belum memiliki
// implementasinya

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(

      //  MaterialApp punya method build(), karena ia adalah turunan dari StatelessWidget.

      // nah ketika kita return widget di dalam build
      // misal si materialApp ini, maka
      // MaterialApp.createElement() -> akan dipanggil, lalu
      // Element.mount() dipanggil → ini akan:
      // memanggil build() pada MaterialApp
      // lalu...

      // return Scaffold(
      //   appBar: ...,
      //   body: ...
      // );

      // begituseterusnya

    // MaterialApp (Widget)
    // ↓ build()
    // → Scaffold (Widget)
    //    ↓ build()
    //    → AppBar (Widget)
    //       ↓ build()
    //       → Text("...") ← ini paling ujung (leaf)



      home: Scaffold(
        appBar: AppBar(title: Text("heloo ini adalah aplikasi flutter"),),
        body: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            color: Colors.amber,
            child: Center(
              child: Text("haloo ini dari aplikasi flutter", 
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.pink,
                fontStyle: FontStyle.italic,
                fontFamily: "Roboto",
                decoration: TextDecoration.underline
                ),
              ),
            )
          )
        )
      )
    );
  }
}

// nah jadi ketika si 
// kan gini pertama itu pas runApp itu dipanggil
// maka // myApp.createElement() akan dipanggil
// kemudian akan mengembalikan StatelessElement
// jadi didalam statelesswidget ini dia punya
// method yg ga dieverrride
// yaitu // createElement() yang akan mengembalikan StatelessElement

// nah gini
// StatelessElement createElement() {
//   return new StatelessElement(this);
// }

// nah tapi si statelessElement ini
// isinya adalah
// class StatelessElement extends ComponentElement {
//   ...
//   @override
//   Widget build() => widget.build(this);
// }

// berati buildContext yang ada di parameter build itu
// adalah instance dari StatelessElement itu sendiri

