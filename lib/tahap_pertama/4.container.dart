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
          width: 500.0,
          height: 800.0,
          color: const Color.fromARGB(255, 151, 209, 132),
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
                  boxShadow: [ // but box shadow
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


// jadi untuk mendekorasi sebuah containre
// kita memerlukan paramter decoration
// nah decoration ini adalah sebuah objek BoxDecoration

// untuk dekorasi pada text, kita memerlukan style yang
// merupakan objek TextStyle