import 'package:flutter/material.dart';

// PENTING
// jadi statefull widget ini kan selau dipanggil
// ketik setStatenya dipanggil
// maka kalo dia di panggil, maka hanya akan rebuild widget itu saja

// https://chatgpt.com/c/6885bb99-df10-8009-ac93-1702161d3f30
// https://chatgpt.com/c/6885bb99-df10-8009-ac93-1702161d3f30

// jadi stateFull widget ini berfungsi
// untuk melakukan perubahan ketika ada perubahan
// tapi tanpa rebuild seluruh widget

// // fungsi
// merespon interaksi user,
// mengupdate tampilan UI tanpa rebuild seluruh app,
// menyimpan data lokal dalam komponen,

// class MyWidget extends StatefulWidget {
//   @override
//   _MyWidgetState createState() => _MyWidgetState(); // menghubungkan ke state
// }

// jadi nanti yang di rebuild itu hanya widget ini saja

// class _MyWidgetState extends State<MyWidget> {// disini artinya
// adalah class ini merupakan sebuah state dari MyWidget
//   // variabel dan logic yang menyimpan state ada di sini

//   @override
//   Widget build(BuildContext context) {
//     return Container(); // tampilan UI dibangun berdasarkan state di sini
//   }
// }

// Ketika runApp() dijalankan, Flutter buat Element tree.
// Jika menemukan StatefulWidget, dia:
// buat instance dari StatefulWidget
// lalu panggil createState() untuk membuat State object.
// _MyWidgetState dibangun dan memanggil build() untuk membuat tampilan awal.
// Ketika ada perubahan (misal tombol diklik), panggil setState().
// setState() memberi tahu Flutter bahwa state berubah.
// Flutter memanggil kembali build(), dan hanya widget itu yang dibangun ulang, bukan seluruh app.

// jadi fungsi dari method createState ini adalh
// untuk menggabungkan antara widget dengan statenya
// jadi ketika kita membuat sebuah stateful widget

// berati gini
// kita buat class yang extends StatefulWidget
// lalu kita overide method createState(), yang fungisnya adalh
// /meggabungkan antara widget kita, dengan statenya

// lalu kita buat statenya, degan cara membaut class yang extends State<Widget>
// nah dia ini extends sebauh State yang merujuk pada widget kita sebelumnya

// artinya class ini adalah sebuah state yang bsia breubha ubah
// dan berubah ketika si setState dipanggil
// dan hanya class ini saja yang akan di rebuild

// atau gini
// 1️⃣ Pertama, kita buat class yang extends StatefulWidget.
//    Class ini adalah definisi dari widget yang state-nya bisa berubah.

// 2️⃣ Lalu, kita override method createState().
//     → Fungsinya adalah untuk menghubungkan Widget ini dengan State-nya.
//     → Jadi createState() akan menghasilkan class turunan dari State<>,
//       yang menyimpan logika dan data yang bisa berubah-ubah.

// 3️⃣ Setelah itu, kita buat class state-nya dengan cara:
//     class _NamaState extends State<NamaWidget> { ... }
//     → Di sinilah semua logic, variabel, dan fungsi perubahan UI kita tempatkan.
//     → Class ini akan memiliki lifecycle seperti initState, build, dispose, dll.

// 4️⃣ Ketika kita memanggil setState(() {}), Flutter akan:
//     → Menandai bagian widget ini sebagai dirty,
//     → Lalu hanya memanggil ulang method build() di dalam class state,
//     → Jadi, hanya bagian widget ini saja yang di-rebuild, **bukan seluruh aplikasi**.

// ✅ Artinya:
//     - Widget (`StatefulWidget`) bersifat tetap (immutable).
//     - State (`State<>`) bersifat dinamis dan bisa berubah.
//     - Setiap kali ada perubahan melalui setState(), **yang dibangun ulang adalah build() dari State tersebut saja**.

// CONTOHNYA
// disini saya ignin agar appbar saya itu stateless
// dan body nya itu stateful

void main() {
  runApp(MyApp());
}

// berati pertama kita baut dulu statelessnya
// untuk MyApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // jadi build context ini sebagai pengenal untuk widget ini
    // ketika nanti di taruh di tree widget
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("ini adalah appbar")),
        // jadi di bodynnya kita baut widget
        // yang bisa berubah ubah
        body: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 176, 80, 141),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [MyStateFulWidgetNya()],
            ),
          ),
        ),
      ),
    );
  }
}

// berati sekarnag kita tinggal buat class widgetStatefulnya
// kemudian state dari class widgetStatefulnya

class MyStateFulWidgetNya extends StatefulWidget {
  @override
  _MyStateNya createState() {
    return _MyStateNya();
  }
}

class _MyStateNya extends State<MyStateFulWidgetNya> {
  // nah disini kita buat fungsinya

  // nah disni kita buat field
  // nah dia ini yang akan di pake di hasil
  int number = 0;

  void tambahAngka() {

    // nah adi setState ini akan di panggil ketika di klik
    // dan ketika setState ini di panggil otomatis dia akan rebuild / reload lagi
    // tapi hanya widget ini saja yang akan di rebuild
    // jadi ketika kita panggil fungsi ini
    // maka dia akan menambah angka
    setState(() {
      number++;
    });
  }

  // JADI SETSTATE INI ADALAH PERINTAH UNTUK REBUILD / REFRESH

  void kurangAngka() {
    setState(() {
      number--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // nah disini tinggal kita lanjutin dari yang si body dari si MyAppnya
    return Container(
      padding: EdgeInsets.fromLTRB(2.0, 100.0, 2.0, 50.0),
      width: 300.0,
      height: 300.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: const Color.fromARGB(255, 247, 246, 246),
          width: 5.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            offset: Offset(2.0, 2.0),
          ),
        ],
        gradient: LinearGradient(
          colors: [Colors.red, Colors.blue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              // agar ukuran ntestnya berubah sesuai number
              '${this.number.toString()}',
              style: TextStyle(fontSize: 10 + this.number.toDouble(), color: Colors.white),
            ),
            // disni kita buat buttonnya
            Container(
              child: ElevatedButton(
                child: Text('Tambah'),
                onPressed: tambahAngka,
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text('Kurang'),
                onPressed: kurangAngka,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Panggil MyStateFulWidgetNya.createElement() → return StatefulElement.
// Lalu panggil createState() → membuat objek _MyStateNya.
// Hubungkan widget dan state:
// _MyStateNya.widget = MyStateFulWidgetNya
// StatefulElement menyimpan referensi ke widget dan state.

// main()
//   ↓
// runApp(MyApp()) 
//   ↓
// MyApp (StatelessWidget)
//   ↓
// MyApp.createElement() → StatelessElement
//   ↓
// MyApp.build() 
//   ↓
// MaterialApp → Scaffold → AppBar + MyStateFulWidgetNya
//   ↓
// MyStateFulWidgetNya.createElement() → StatefulElement
//   ↓
// MyStateFulWidgetNya.createState() → _MyStateNya
//   ↓
// Hubungkan _MyStateNya.widget = MyStateFulWidgetNya
//   ↓
// _MyStateNya.build(context) → Center()