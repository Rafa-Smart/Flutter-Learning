// StatelessWidget adalah salah satu jenis widget di Flutter yang tidak memiliki 
// state (keadaan) yang berubah-ubah selama siklus hidupnya. Artinya, begitu widget 
// dibuat dan ditampilkan, tampilannya akan tetap konstan — tidak akan berubah kecuali 
// parent-nya memberikan data baru atau widget-nya dibuat ulang (rebuild).
// File: stateless_widget_penjelasan.dart

// Import library utama Flutter yang berisi semua komponen UI
import 'package:flutter/material.dart';

// Fungsi utama yang akan pertama kali dijalankan oleh Flutter
void main() {
  // Fungsi runApp adalah fungsi global dari Flutter SDK
  // Fungsi ini digunakan untuk memulai aplikasi Flutter dan
  // menampilkan widget utama (root widget) ke layar
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contoh StatelessWidget'),
        ),
      ),
    );
  }
}


// nah jaid ga ada perubaha yang bisa bisa dilakukan
// kecuali ketika kita rebuild, maka tetep bisa
// gitu









// StatelessWidget adalah salah satu dari dua jenis utama widget di Flutter,
// yaitu: StatelessWidget dan StatefulWidget.
//
// StatelessWidget adalah widget yang:
// - Tidak memiliki *state* internal yang dapat berubah-ubah saat aplikasi berjalan.
// - Bersifat immutable: artinya, setelah widget dibangun (build), nilainya tidak berubah.
//
// Biasanya digunakan untuk:
// - Tampilan statis, seperti teks, gambar, ikon, warna latar, dan layout sederhana.
// - Komponen UI yang tidak perlu melakukan perubahan atau respon terhadap interaksi.
//
// Cara kerjanya:
// 1. Flutter memanggil method `build()` dari widget ini untuk menghasilkan tampilan UI.
// 2. Karena tidak memiliki state, maka jika ingin ada perubahan, developer harus
//    membangun ulang widget baru dari luar (biasanya dengan bantuan StatefulWidget).
//
// Kenapa harus pakai StatelessWidget?
// - Ringan dan efisien, karena tidak memerlukan pengelolaan state.
// - Lebih mudah diuji (testing) dan lebih mudah dipahami.
// - Lebih cepat dibangun karena hanya bergantung pada data yang dikirim dari luar.
//
// Alur internal:
// - Widget dibuat => dipasang ke tree => method build() dipanggil => menghasilkan widget turunan.
// - Jika input berubah (misalnya parameter constructor), Flutter akan membandingkan widget lama dan baru.
// - Jika tidak ada perubahan, Flutter akan menghindari rebuild untuk efisiensi.
//
// ================================================================================

// Contoh implementasi StatelessWidget
// class MyApp extends StatelessWidget {
//   // Constructor (tidak wajib jika tidak punya parameter)
//   const MyApp({super.key});

//   // Method wajib yang harus dioverride
//   // build() akan dipanggil oleh Flutter untuk membuat tampilan UI dari widget ini
//   @override
//   Widget build(BuildContext context) {
//     // MaterialApp adalah root widget yang menyediakan struktur dasar aplikasi material design
//     return MaterialApp(
//       // Scaffold adalah struktur dasar halaman yang menyediakan AppBar, body, dsb
//       home: Scaffold(
//         // AppBar adalah bagian atas aplikasi yang biasanya berisi judul atau menu
//         appBar: AppBar(
//           title: Text("Penjelasan StatelessWidget"),
//         ),

//         // Body dari halaman
//         body: Center(
//           // Center digunakan untuk menengahkan child-nya (di tengah secara horizontal dan vertikal)
//           child: Column(
//             // Column digunakan untuk menyusun widget secara vertikal
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Teks statis, cocok dengan StatelessWidget karena tidak akan berubah
//               Text(
//                 'Halo! Ini adalah contoh StatelessWidget.',
//                 style: TextStyle(fontSize: 20),
//               ),

//               // Jarak antar elemen (spasi vertikal)
//               SizedBox(height: 20),

//               // Contoh tampilan ikon
//               Icon(
//                 Icons.star,
//                 color: Colors.amber,
//                 size: 40,
//               ),

//               // Tambahan informasi
//               SizedBox(height: 20),
//               Text(
//                 'Tampilan ini tidak akan berubah karena ini stateless.',
//                 style: TextStyle(fontSize: 16, color: Colors.grey),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ================================================================================
// CATATAN TAMBAHAN:
// Jika kita ingin membuat UI yang dapat berubah (misalnya: ketika user menekan tombol),
// maka kita harus menggunakan StatefulWidget, karena StatelessWidget tidak bisa menyimpan state.
//
// Namun untuk sebagian besar UI sederhana dan komponen yang tidak berubah,
// menggunakan StatelessWidget adalah praktik terbaik karena lebih cepat dan efisien.
//
// Jangan lupa: semua widget di Flutter bersifat deklaratif,
// artinya kita menyatakan "UI-nya seperti ini" berdasarkan data,
// bukan "ubah ini kalau user klik ini" seperti imperatif programming.
//
// ================================================================================

