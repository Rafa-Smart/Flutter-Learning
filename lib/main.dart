import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Fungsi utama untuk menjalankan aplikasi
}

// Widget utama aplikasi
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Flutter Pertama',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Warna utama aplikasi
      ),
      home: HomePage(), // Halaman pertama yang ditampilkan
    );
  }
}

// Halaman Home
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// State untuk HomePage (berbasis StatefulWidget)
class _HomePageState extends State<HomePage> {
  int _counter = 0; // Variabel penampung jumlah klik

  void _incrementCounter() {
    setState(() {
      _counter++; // Tambah counter saat tombol ditekan
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Kamu sudah menekan tombol sebanyak:'),
            Text(
              '$_counter', // Menampilkan nilai counter
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // Fungsi saat tombol ditekan
        tooltip: 'Tambah',
        child: Icon(Icons.add),
      ),
    );
  }
}
