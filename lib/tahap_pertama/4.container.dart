import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Ini adalah AppBar")),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.indigo,
                const Color.fromARGB(255, 233, 30, 99),
                const Color.fromARGB(255, 40, 134, 52),
              ],
            ),
          ),
          width: 500.0,
          height: 800.0,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100.0,
                height: 100.0,
                padding: EdgeInsets.all(10.0),
                
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors:<Color>[
                      const Color.fromARGB(255, 70, 78, 126),
                      const Color.fromARGB(255, 13, 144, 63),
                      const Color.fromARGB(255, 134, 40, 40),
                    ]
                  ),
                  boxShadow: [ // buat box shadow
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(8.0, 8.0),
                      blurRadius: 14.0,
                    ),
                  ],
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 6.0,
                  )

                  // kalo kita pake sisi, maka kita ga bisa pake 
                  // border radius
                  // border: Border(
                  //   top: BorderSide(color: Colors.white, width: 2.0),
                  //   bottom: BorderSide(color: Colors.blueGrey, width: 24.0),
                  //   left: BorderSide(color: Colors.white, width: 2.0),
                  //   right: BorderSide(color: Colors.white, width: 2.0),
                  // ),
                ),
                child: Center(
                  child: Text("kotak hahahahahaha", 
                  // artnya jika lebih dari container,
                  // maka akan ke bwah / line baru
                  // tapi hanay sampai 2 line saja
                  // lalu jika masih tetap panjang
                  // maka akan dipotong dengna cara elipsis
                  // jadi elipsisnya itu titik tiga
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ingat, dalam 1 container itu gaboleh ada 2 
// deklarasi color
// misal di contianernya ada color, dan di decoration -> BOxdecoration ada color
// itu akan error


// jadi untuk mendekorasi sebuah containre
// kita memerlukan paramter decoration
// nah decoration ini adalah sebuah objek BoxDecoration
// yang isinya itu bisa gradient, ata shadow box


// untuk dekorasi pada text, kita memerlukan style yang
// merupakan objek TextStyle