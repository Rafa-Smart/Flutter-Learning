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

class MyApp extends StatelessWidget {
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

  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       appBar: AppBar(title: Text("Contoh ListView")),
  //       body: ListView.builder(
  //         itemCount: dataList.length, // jumlah item
  //         itemBuilder: (context, index) {
  //           // setiap item ditampilkan dalam Card
  //           return Card(
  //             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  //             child: ListTile(
  //               leading: Icon(Icons.local_grocery_store),
  //               title: Text(dataList[index]), // menampilkan nama buah
  //               onTap: () {
  //                 // aksi ketika ditekan
  //                 print("Anda memilih: ${dataList[index]}");
  //               },
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Contoh ListView")),
        body: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: const Color.fromARGB(179, 7, 112, 182),
              child: ListTile(
                leading: Icon(Icons.local_fire_department_rounded),
                title: Text(
                  dataList[index],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ), // menampilkan nama buah
                onTap: () {
                  print("Anda memilih: ${dataList[index]}");
                },
                subtitle: Text(
                  "Ini adalah buah ${dataList[index]}",
                  style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 107, 1, 1)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
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