import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

   
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final List<String> datas = List.generate(20, (i) => 'data${i}');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ini app bar')),
        body: ListView.separated(

          // nah nanti kita bisa pake separator untuk antar widgetnya

          // disni kita kasih context siapa tau didalam
          // elemen si separatedBuilder ini dia buth
          // contexat misal untuk akses theme
          separatorBuilder: (context, index) {
            return SizedBox(width: 10,height: 10,);
          },
          scrollDirection: Axis.horizontal,
          // jadi aklo horizontal maka nanti heightnya itu akan full layar
          itemCount: datas.length,
          itemBuilder: (context, index) {
            return Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(child: Text(datas[index], style: TextStyle(fontSize: 12),)),
            );
          },
        ),
      ),
    );
  }
}

// ini itu listBuilder
// ListView.builder(
//           scrollDirection: Axis.horizontal,
//           // jadi aklo horizontal maka nanti heightnya itu akan full layar
//           itemCount: datas.length,
//           itemBuilder: (context, index) {
//             return Container(
//               width: 100,
//               height: 100,
//               margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//               decoration: BoxDecoration(color: Colors.blue),
//               child: Center(child: Text(datas[index], style: TextStyle(fontSize: 12),)),
//             );
//           },
//         ),


// ini yang list view biasa
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //      home: Scaffold(
  //       appBar: AppBar(title: Text('ini app bar')),
  //       body: ListView(
  //         // nah kalo listviewnya ini akan otomatis penuh
  //         // kalo ktia menggunakan scroonya itu vertical
  //         scrollDirection: Axis.horizontal, // ini artinya heightnya akna full

  //         // kalo yang vertikal berati natni  widthnya akna full
  //         children: [
  //           Container(
  //             width: 50,
  //             height: 300,
  //             decoration: BoxDecoration(
  //               color: Colors.blue
  //             ),
  //           ),
  //           Container(
  //             width: 50,
  //             height: 300,
  //             decoration: BoxDecoration(
  //               color: Colors.red
  //             ),
  //           ),
  //           Container(
  //             width: 50,
  //             height: 300,
  //             decoration: BoxDecoration(
  //               color: Colors.yellow
  //             ),
  //           ),
  //           Container(
  //             width: 50,
  //             height: 300,
  //             decoration: BoxDecoration(
  //               color: Colors.purple
  //             ),
  //           ),
  //           Container(
  //             width: 50,
  //             height: 300,
  //             decoration: BoxDecoration(
  //               color: Colors.green
  //             ),
  //           ),
  //         ],
  //       )
  //     ),
  //   );
  // }