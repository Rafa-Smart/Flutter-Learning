// https://chatgpt.com/c/6888cd38-400c-8009-bf0e-820c93fcd609


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gradient AppBar"),
        centerTitle: true,
        elevation: 4,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepPurpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Text("Isi Halaman"),
      ),
    );
  }
}


// Properti	Fungsi
// title	Widget utama (biasanya Text) yang muncul di tengah AppBar.
// actions	Widget di sisi kanan (biasanya tombol icon seperti search, settings).
// leading	Widget di sisi kiri (biasanya ikon drawer atau back).
// backgroundColor	Warna latar belakang (tidak dipakai jika pakai gradient).
// flexibleSpace	Widget di belakang seluruh isi AppBar, di sinilah gradient diletakkan.
// elevation	Bayangan di bawah AppBar. Semakin tinggi, semakin tebal bayangannya.
// centerTitle	Menentukan apakah title berada di tengah atau tidak (default: false di Android, true di iOS).
// toolbarHeight	Tinggi dari AppBar. Default 56.
// shape	Membentuk sisi AppBar (bisa melengkung, bulat, dsb).
// bottom	Biasanya digunakan untuk TabBar.
// automaticallyImplyLeading	Menentukan apakah akan otomatis menampilkan tombol back/drawer.