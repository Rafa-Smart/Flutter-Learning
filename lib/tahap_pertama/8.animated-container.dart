import 'package:flutter/material.dart';
import 'dart:math';
// https://chatgpt.com/c/6885ebf1-3c98-8009-b794-40a0b4b3890e
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Animated Container")),
        body: Container(
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.red],
            ),
          ),
          child: MyStateFulWidget(),
        ),
      ),
    );
  }
}

class MyStateFulWidget extends StatefulWidget {
  @override
  _StateFulNya createState() {
    return _StateFulNya();
  }
}

class _StateFulNya extends State<MyStateFulWidget> {
  // disini kita buat random
  Random random = Random();
  

  @override
  // jadi kalo ini tidka berubah ubah, maka akn error
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onDoubleTap: () => setState(() {
              // ketika di double tap, akan mengubah ukuran dan warna
              // karena akan rebuild
            }),
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              // jadi kita bisa ubah ukuran lebar dan tinggi
              // jadi kalo nextint itu maksdunaya adalah yang terakhir
              // ga akan diambil, jadi kalo 100 berati hanya 99
              width:
                  80 + random.nextInt(101).toDouble(), // lebar acak antara 80 dan 150
              height:
                  80 + random.nextInt(101).toDouble(), // tinggi acak antara 80 dan 150
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(
                      255,
                      random.nextInt(156),
                      random.nextInt(156),
                      random.nextInt(156),
                    ),
                    Color.fromARGB(
                      255,
                      random.nextInt(256),
                      random.nextInt(256),
                      random.nextInt(256),
                    ),
                    Color.fromARGB(
                      255,
                      random.nextInt(256),
                      random.nextInt(256),
                      random.nextInt(256),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // bisa pke ini, tapi bisa juga pake gesture
          // SizedBox(height: 90), // jarak antar widget
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.black,
          //     foregroundColor: Colors.white,
          //   ),
          //   onPressed: (){
          //     // ketika ditekan, akan rebuild widget
          //     // tpai gausah kita uabh ubah si randomnya
          //     // karna sudah otomatis berubah
          //     setState(() {});
          //   }, 
          //   child: Text("Ubah",
          //     style: TextStyle(
          //       fontSize: 20,
          //     )
          //   )
          // )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// // Fungsi utama untuk menjalankan aplikasi Flutter.
// void main() {
//   runApp(MyApp());
// }

// // Kelas utama aplikasi Flutter kita.
// // Menggunakan StatefulWidget karena kita ingin memanipulasi state (misal: ukuran atau warna berubah).
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// // State untuk MyApp, tempat logika dan perubahan UI akan terjadi.
// class _MyAppState extends State<MyApp> {
//   // Variabel untuk menyimpan ukuran lebar dan tinggi container
//   double _width = 200;
//   double _height = 200;

//   // Variabel warna awal container
//   Color _color = Colors.blue;

//   // Fungsi untuk mengubah ukuran dan warna container secara acak
//   void _changeContainer() {
//     setState(() {
//       // Ubah ukuran lebar dan tinggi
//       _width = _width == 200 ? 300 : 200;
//       _height = _height == 200 ? 150 : 200;

//       // Ubah warna secara bergantian
//       _color = _color == Colors.blue ? Colors.red : Colors.blue;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // MaterialApp sebagai root dari aplikasi
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Contoh AnimatedContainer"),
//         ),
//         body: Center(
//           // AnimatedContainer adalah widget seperti Container,
//           // tetapi memiliki kemampuan untuk menganimasi perubahan properti.
//           child: AnimatedContainer(
//             // Lebar container
//             width: _width,

//             // Tinggi container
//             height: _height,

//             // Warna latar belakang container
//             color: _color,

//             // Durasi animasi saat properti berubah
//             duration: Duration(seconds: 1),

//             // Kurva animasi: bisa linear, easeIn, bounce, dll
//             curve: Curves.easeInOut,

//             // Tambahan child (widget di dalamnya)
//             child: Center(
//               child: Text(
//                 "Klik Tombol di Bawah!",
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ),
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: _changeContainer, // Ketika ditekan, akan ubah state
//           child: Icon(Icons.play_arrow),
//         ),
//       ),
//     );
//   }
// }
