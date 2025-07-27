// ListView adalah widget scrollable untuk menampilkan data dalam bentuk list
// (daftar) secara vertikal (default) atau horizontal.

// Setiap item di dalam ListView biasanya berasal dari sebuah List data.

// Jika menggunakan ListView.builder:
// Flutter hanya membuat item yang tampak di layar.
// Saat user scroll, item lama dihapus dari memory, dan item baru dibuat secara otomatis (lazy loading).

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Ini adalah daftar data yang ingin ditampilkan
  final List<String> dataList = [
    "Apel",
    "Jeruk",
    "Pisang",
    "Anggur",
    "Melon",
    "Semangka",
    "Strawberry",
    "Kiwi",
    "Mangga",
    "Nanas",
    "Pepaya",
    "Blueberry",
    "Raspberry",
    "Ceri",
    "Persik",
    "Plum",
    "Delima",
    "Kelengkeng",
    "Durian",
    "Sirsak",
    "Jambu",
    "Salak",
    "Kedondong",
  ];

  List<Widget> widgets = [];

  // nah disini kita buat perluangannya ketika si class ini di panggil
  // jadi kan kalo class ini dipanggil maka fngisyang akan dijalankan
  // itu adalh construcornya, maka kita bisa membuat widget disini

  // _MyAppState() {
  //   for (var i = 0; i < 20; i++) {
  //     widgets.add(
  //       Text(
  //         "halo ${i + 1}".toString(),
  //         style: TextStyle(
  //           fontSize: 20,
  //           fontWeight: FontWeight.bold,
  //           color: Colors.blue,
  //         ),
  //       ),
  //     );
  //   }
  // }

  // disini ktia manual aja

  void tambahData() {
    setState(() {
      widgets.add(
        Text(
          "Data Baru ${widgets.length + 1}",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      );
    });
  }

  void kurangData() {
    if (widgets.isNotEmpty) {
      setState(() {
        widgets.removeLast();
      });
    }
  }

  @override
  // ini list view biasa
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Contoh ListView")),
        body: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Warna tombol
                      foregroundColor: Colors.white, // Warna teks tombol
                    ),
                    onPressed: tambahData,
                    child: Text("tambah data"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Warna tombol
                      foregroundColor: Colors.white, // Warna teks tombol
                    ),
                    onPressed: kurangData,
                    child: Text("kurang data"),
                  ),
                ),
              ],
            ),

            // nah disini kita spread, inget, karena kalo langsn kita tambahkan
            // maka nanti malah jadi array of array
            // ...widgets,

            // atau kalo kita igni buat lagi pake column
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: widgets,
            ),

          ],
        ),
      ),
    );
  }

  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       appBar: AppBar(title: Text("Contoh ListView")),
  //       body: ListView.builder(
  //         itemCount: dataList.length,
  //         itemBuilder: (context, index) {
  //           return Card(
  //             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  //             color: const Color.fromARGB(179, 7, 112, 182),
  //             child: ListTile(
  //               leading: Icon(Icons.local_fire_department_rounded),
  //               title: Text(
  //                 dataList[index],
  //                 style: TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.white,
  //                 ),
  //               ), // menampilkan nama buah
  //               onTap: () {
  //                 print("Anda memilih: ${dataList[index]}");
  //               },
  //               subtitle: Text(
  //                 "Ini adalah buah ${dataList[index]}",
  //                 style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 107, 1, 1)),
  //               ),
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }
}


// jadi maksud dari context ini adalah, berati ini adalah posisi dari widget ini
// itemcount itu adalh property jumlah yang menerima panjang dari sebuah list
// kalo ga ada ini nanti si listview ini ga tau berapa banyak item yang akan ditampilkan

// nah jadi itemBuilder ini adalah fungsi yang menerima context dan index
// dan mengembalikan widget yang akan ditampilkan pada index tersebut
// dan ini mirip seperti map di js

// nah itembuiilder ini mengembalikan widget card
// card ini adalah widget yang menampilkan item dengan tampilan yang lebih menarik
// didalam card ini ada widget listtile
// listtile ini adalah widget yang menampilkan item dengan icon, judul, dan aksi ketika ditekan

// mirip kayak li di html untuk yang listtile