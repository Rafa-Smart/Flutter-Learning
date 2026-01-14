

// nih construkctornya
// Image.asset('path')      // Gambar dari folder assets
// Image.network('url')     // Gambar dari internet
// Image.file(file)         // Gambar dari file lokal (misal: galeri HP)
// Image.memory(bytes)      // Gambar dari memori dalam bentuk byte[]



import 'package:flutter/material.dart';

// Fungsi utama untuk menjalankan aplikasi Flutter
void main() {
  runApp(MyApp());
}

// Root widget dari aplikasi
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contoh Image Widget',
      home: Scaffold(
        appBar: AppBar(title: Text('Demo Gambar di Flutter')),

        // Isi utama aplikasi
        body: ListView(

            children: [

              // Gambar dari assets lokal (harus didaftarkan di pubspec.yaml)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/icon-1.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain, // mengatur cara gambar dimuat
                ),
              ),

              // Gambar dari internet
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://media.istockphoto.com/id/1443562748/id/foto/kucing-jahe-lucu.jpg?s=612x612&w=0&k=20&c=g--RaRzUgk83osyJGx88ZtoChTk3VzP8n86EQHvc7Ko=',
                  width: 200,
                  height: 100,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Text('Gagal memuat gambar.');
                  },
                ),
              ),

              // Gambar dengan efek warna
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/icon-1.png',
                  color: Colors.red.withOpacity(0.5),
                  colorBlendMode: BlendMode.darken,
                  width: 100,
                  height: 100,
                ),
              ),

              // Gambar di dalam  Container ber-background
              Container(
                width: 200,
                height: 200,
                color: Colors.blue[50],
                child: Image.asset(
                  'assets/images/icon-1.png',
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                ),
              ),

            ],
          ),
        ),
    );
  }
}
