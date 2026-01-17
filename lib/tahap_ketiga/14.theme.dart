// ini penting banget

// https://chat.deepseek.com/a/chat/s/bb2c4993-f932-40df-ac86-ac20082fe2a3


// jadi gini alur ketika aplikasi itu igin mendapatkan sebuah style

// Apa yang Terjadi di Balik Layar?
// Ketika kita memanggil Theme.of(context), Flutter akan naik ke atas pohon widget sampai menemukan widget Theme terdekat.
// Jika tidak ada, akan kembali ke tema default (Material Design default).
// Context digunakan sebagai "petunjuk" untuk menelusuri pohon widget.

// 2. Perbedaan Antara Tema Global dan Lokal
// Tema Global: Didefinisikan di MaterialApp, berlaku untuk seluruh aplikasi.
// Tema Lokal: Didefinisikan dengan widget Theme, hanya berlaku untuk subtree di bawahnya.

// gini nih
// Theme.of(context) // mencari tema dengan cara:
// 1. Lihat widget sendiri (apakah punya tema lokal?)
// 2. Jika tidak, naik ke parent widget
// 3. Terus naik sampai MaterialApp
// 4. Jika tidak ditemukan, gunakan default dari design material appnya


// nah jadi di misalkan di themeText kita asih theme untuk text misal
// warna biru tanpa kaya headline / dll tapi lngusng aja pake TextStyle
// maka nanti untuk smua text tanpa kita kasih style
// mka dia defaultna yang sebelumnya kan hitamm untuk color, nanti
// kalokita udah set doa di theme aka color yang di pake di thmeyang akna di pake


// contoh aja
// CONTOH 1: Tanpa style (otomatis pakai theme)
// Text('Ini pakai theme default')  
// // Akan menggunakan: Theme.of(context).textTheme.bodyMedium

// // CONTOH 2: Dengan style (override theme)
// Text(
//   'Ini pakai style manual',
//   style: TextStyle(color: Colors.red),  // Meng-override theme
// )

// // CONTOH 3: Menggunakan theme tapi dengan modifikasi
// Text(
//   'Ini pakai theme tapi diubah',
//   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//     fontWeight: FontWeight.bold,
//   ),
// )


import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Home(),
    );
  }
}


class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}