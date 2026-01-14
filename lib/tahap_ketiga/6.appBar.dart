import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// leading itu untuk logo biasnaya
// title itu untuk judul
// actions itu bisa untuk settings, log out, dan lain lain dan ini tuh List<Widget>
// bottom itu bagian bawah
// flexible space itu seluruh tempat selain dari yang diaatas
// jadi ad di sela sela / smeuanya, jadi bisa jgua kita ganti backgourndnya

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        // nah ii iu sebenernya untuk parameter appBar, sebernernya dia butuh Preferensize juga sama kaya bottom
        // tapi karena AppBar ini sudh impelmentasi PreferredSizeWidget
        // jadi dia bisa du gunakan
        // cba aja ctrl click ke AppBar
        appBar: AppBar(
          leading: Container(
            width: 30,
            height: 30,
            color: Colors.blue,

            // maka ini tidak akna ngaruh untuk heighnya
            // /tapi kalo mau ubah widht dari leading kita bisa
            // pake parameter leadingWidth
          ),

          // ini unuk ngatur titleSpacing
          // jadi akan ngatur spacingnya dari dia ke kanan dan dari dia ke kiri -> horizontal simetrik
          // titleSpacing: 512,

          // kalo title ini bisa di custom
          title: Container(
            // width: 50,
            height: 30,
            color: Colors.redAccent,
          ),
          centerTitle: false,
          actions: [
            // dan disni heigtnya juga mirip dnena leading, jadi ga bisa di ubah ubha
            Container(width: 20, height: 20, color: Colors.pink),
            Container(width: 20, height: 20, color: Colors.brown),
            Container(width: 20, height: 20, color: Colors.pink),
            Container(width: 20, height: 20, color: Colors.brown),
          ],

          // disnii jug aada bottom
          // dan dia ini fungsinya untuk emnambah tinggi pada baru pada si appbar
          // jadi ini akna nambah 200 pixel

          // disin ktia pasang juga untuk si containernya ii agar 200 ingginya
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(200),
            child: Container(
              color: Colors.cyanAccent,
              width: double.infinity,
              height: 200,
            ),
          ),
        ),

        body: Center(
          child: Column(
            children: [
              Text('gambar appbar'),
              Image.asset('images/appBar.png', fit: BoxFit.cover),
            ],
          ),
        ),
      ),
    );
  }
}
