import 'package:flutter/material.dart';

// jadi kalo misakan kita mau gulir gulir si row ke samping kanan dan kiri
// kita bungkus si row ke dalam singleChildScrollView

// dan bisa juga untuk vertikal, tapi mungkin klo vertikan kita bisa pake listView

void main() {
  runApp(App());
}

// bisa juga gini jadi ada fitur di sini itu
// jadi kaya periantah tapi komen misa ignore : must_is_imutabble

class App extends StatelessWidget {
  App({super.key});
  final List<Map<String, dynamic>> datas = [
    {
      "name": "Rafa 1",
      "age": 17,
      "hobby": ['game', 'test', 'plis22'],
    },
    {
      "name": "Rafa 2",
      "age": 40,
      "hobby": [
        'game',
        'test',
        'plis',
        'game',
        'test',
        'plis',
        'game',
        'test',
        'plis',
        'game',
        'test',
        'plis',
        'game',
        'test',
        'plis',
        'game',
        'test',
        'plis',
        'game',
        'test',
        'plis',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          // entries ini akna mengembalikan data = [key, value]
          children: datas.map((data) {
            List<String> hobby = data['hobby'];
            return Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(),
                      Column(
                        children: [
                          // ga bisa karena disini keynya itu harus string
                          // Text("nama: ${data.name}")

                          // jadi harus gini
                          Text('name: ${data['name']}'),
                          Text('age: ${data['age']}'),
                        ],
                      ),
                    ],
                  ),
                  SingleChildScrollView(

                      // jadi di dalam si single ini harus ada row
                      // kalo yang sebelumnya itu ktia salah strukturnya
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // kalo ga pake ... nanti akna ada list dalam list
                        // karena from ini kembalikan list
                        // jadi harus kita spread
                    
                        // atau kalo biar ga error, si data['hobby]
                        // kita masukan ke dalam variable
                        // llau tipenya itu list of string
                        ...hobby.map((hobby) {
                          // return Container(
                          //   // child: Row(
                          //   //   children: [Icon(Icons.person), Text(hobby)],
                          //   // ),
                    
                          //   // agar kalo datanya banyak maka biar bisa di scroll
                          //   // kita pake singleChildScroll
                          //   child: SingleChildScrollView(
                          //     scrollDirection: Axis.horizontal,
                          //     child: Row(
                          //       children: [Icon(Icons.person), Text(hobby)],
                          //     ),
                          //   ),
                          // );
                    
                          // ini yang benernya karena gini
                    
                          return Container(
                            child: Row(
                              children: [Icon(Icons.person), Text(hobby)],
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // itu salah

  // karena struktrunya gini
//   Row
//  ├─ SingleChildScrollView
//  │   └─ Row (kecil)
//  ├─ SingleChildScrollView
//  │   └─ Row (kecil)
//  └─ ...

  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       body: ListView(
  //         // entries ini akna mengembalikan data = [key, value]
  //         children: datas.map((data) {
  //           List<String> hobby = data['hobby'];
  //           return Card(
  //             child: Column(
  //               children: [
  //                 Row(
  //                   children: [
  //                     CircleAvatar(),
  //                     Column(
  //                       children: [
  //                         // ga bisa karena disini keynya itu harus string
  //                         // Text("nama: ${data.name}")

  //                         // jadi harus gini
  //                         Text('name: ${data['name']}'),
  //                         Text('age: ${data['age']}'),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //                 Row(
  //                   children: [
  //                     // kalo ga pake ... nanti akna ada list dalam list
  //                     // karena from ini kembalikan list
  //                     // jadi harus kita spread

  //                     // atau kalo biar ga error, si data['hobby]
  //                     // kita masukan ke dalam variable
  //                     // llau tipenya itu list of string
  //                     ...hobby.map((hobby) {
  //                       // return Container(
  //                       //   // child: Row(
  //                       //   //   children: [Icon(Icons.person), Text(hobby)],
  //                       //   // ),

  //                       //   // agar kalo datanya banyak maka biar bisa di scroll
  //                       //   // kita pake singleChildScroll
  //                       //   child: SingleChildScrollView(
  //                       //     scrollDirection: Axis.horizontal,
  //                       //     child: Row(
  //                       //       children: [Icon(Icons.person), Text(hobby)],
  //                       //     ),
  //                       //   ),
  //                       // );

  //                         // ini yang benernya karena gini

  //                       return SingleChildScrollView(
  //                         child: Container(
  //                           child: Row(children: [Icon(Icons.person), Text(hobby)],),
  //                         ),
  //                       );
  //                     }).toList(),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           );
  //         }).toList(),
  //       ),
  //     ),
  //   );
  // }
}
