// https://chatgpt.com/c/68876d29-5128-8009-a6fb-60e38d36c017
import 'package:flutter/material.dart';

// https://chatgpt.com/c/68876d29-5128-8009-a6fb-60e38d36c017
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ini adalah appbar')),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              //
              colors: [
                const Color.fromARGB(255, 194, 198, 195),
                const Color.fromARGB(255, 148, 195, 234),
              ],
            ),
          ),
          child: Center(child: MyAppFulWidget()),
        ),
      ),
    );
  }
}

class MyAppFulWidget extends StatefulWidget {
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyAppFulWidget> {
  var dataHasil = '';

  final List<Map<String, dynamic>> daftarBuah = [
    {
      'nama': 'Mangga',
      'icon': Icons.eco, // daun, menggambarkan kesegaran
      'warna': Colors.orange[700],
    },
    {
      'nama': 'Nanas',
      'icon': Icons.star, // bentuk lancip, mendekati kulit nanas
      'warna': Colors.amber,
    },
    {
      'nama': 'Kiwi',
      'icon': Icons.blur_circular, // bentuk bulat fuzzy
      'warna': Colors.brown[400],
    },
    {
      'nama': 'Melon',
      'icon': Icons.brightness_1, // bulat penuh
      'warna': Colors.lightGreen,
    },
    {
      'nama': 'Durian',
      'icon': Icons.sick, // ekspresi bau kuat
      'warna': Colors.green[900],
    },
    {
      'nama': 'Rambutan',
      'icon': Icons.pets, // menyerupai bulu rambut
      'warna': Colors.redAccent,
    },
    {
      'nama': 'Salak',
      'icon': Icons.shield, // kulit keras
      'warna': Colors.brown,
    },
    {
      'nama': 'Pepaya',
      'icon': Icons.rectangle, // memanjang seperti bentuk pepaya
      'warna': Colors.deepOrange,
    },
    {
      'nama': 'Jambu Biji',
      'icon': Icons.circle_outlined,
      'warna': Colors.pink[200],
    },
    {
      'nama': 'Sirsak',
      'icon': Icons.ac_unit, // melambangkan segar/putih
      'warna': Colors.white,
    },
    {
      'nama': 'Blueberry',
      'icon': Icons.fiber_manual_record, // titik kecil
      'warna': Colors.indigo,
    },
    {
      'nama': 'Stroberi',
      'icon': Icons.favorite, // bentuk hati, seperti stroberi
      'warna': Colors.red[400],
    },
    {
      'nama': 'Delima',
      'icon': Icons.brightness_high, // menyimbolkan biji
      'warna': Colors.deepPurple,
    },
    {
      'nama': 'Ceri',
      'icon': Icons.catching_pokemon, // ikon bulat + batang
      'warna': Colors.red[700],
    },
    {
      'nama': 'Alpukat',
      'icon': Icons.grass, // warna hijau dan natural
      'warna': Colors.green[700],
    },
    {
      'nama': 'Kelapa',
      'icon': Icons.beach_access, // simbol pantai, menggambarkan kelapa
      'warna': Colors.brown[300],
    },
    {
      'nama': 'Kelengkeng',
      'icon': Icons.circle, // bulat kecil
      'warna': Colors.grey[400],
    },
    {
      'nama': 'Cempedak',
      'icon': Icons.auto_awesome, // eksotis, tropis
      'warna': Colors.lime,
    },
    {
      'nama': 'Markisa',
      'icon': Icons.blur_on, // representasi bentuk biji banyak
      'warna': Colors.deepOrangeAccent,
    },
    {
      'nama': 'Sukun',
      'icon': Icons.filter_vintage, // dedaunan, pohon sukun
      'warna': Colors.lime[800],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          // single ini agar hanya satu chid saja
          // karena kita mau pake map
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              // disini kita harus buat spread dulu
              // lalu nanti hasil mapnya
              // kita toListkan
              // jadi hasilnya itu akn widget container
              ...daftarBuah.map((elemenBuah) {
                return Container(
                  child: Draggable<String>(
                    data: elemenBuah["nama"],
                    child: Icon(
                      elemenBuah["icon"],
                      color: elemenBuah["warna"],
                      size: 100,
                    ),

                    // jadi material ini untuk mnegatur box
                    // jadi biasanya ada di sizedbox, lalu material ini utnuk mnegatrunya
                    // ada bnyak parameter namednya
                    feedback: Material(
                      color: Colors.transparent,
                      child: Icon(
                        elemenBuah["icon"],
                        color: elemenBuah["warna"],
                        size: 100,
                      ),
                    ),
                    childWhenDragging: Opacity(
                      opacity: 0.5,
                      child: Icon(
                        elemenBuah["icon"],
                        color: elemenBuah["warna"],
                        size: 100,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),


        // ini ditaruh di column yaa
        // buan di rownya
        DragTarget(
          // jdai disini kita hanya menerima data yang ada di list daftarbuah saja
          onWillAcceptWithDetails: (details) {
            // details ini berisi objek data , nah data itu adalah data yang dikirim
            // dari drageble
            return daftarBuah.any(
              (dataBuah) => details.data.toString() == dataBuah["nama"],
            );
          },
          onAcceptWithDetails: (details) {
            // ini juga sama, details itu adalah objek yang berisi data, nah
            // data itu ada lah data yang dikirim dari user
            setState(() {
              this.dataHasil = details.data.toString();
            });
          },

          builder: (contextBaru, candidateData, rejectedData) {
            // nah ini, adlah contianer yang dibuat unutk tempat
            // si menaruh dragnya
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 120,
              width: 120,
              color: candidateData.isNotEmpty ? Colors.green : Colors.grey,
              child: Center(
                child: Text(
                  candidateData.isNotEmpty ? 'Lepaskan!' : 'Drop di sini',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
        SizedBox(height: 30),
        Text('Hasil Drop: $dataHasil'),
      ],
    );
  }
}



// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Draggable & DragTarget')),
//         body: DragExample(),
//       ),
//     );
//   }
// }

// class DragExample extends StatefulWidget {
//   @override
//   _DragExampleState createState() => _DragExampleState();
// }

// class _DragExampleState extends State<DragExample> {
//   String hasilDrop = 'Belum ada';

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [

//         // DRAGGABLE
//         Draggable<String>(
//           data: "Apel Merah",


//           // ini digunakan ketika di drag, jadi pas di drag itu icon atau elemennya
//           // ingn seperti apa
//           // disini kita baut dia trasparant, artinya
//           //  HANYA ELEMEN ICONNYA SAJA, JADI WARNA KOTAK PUTIH DIPINGGIRNYA
//           // DIHILANGKAN
//           feedback: Material(
//             color: Colors.transparent,
//             child: Icon(Icons.apple, color: Colors.red, size: 80),
//           ),

//           // jadi ini adalah kondisi icon atiu item
//           // setealh di geser, jadi pas digeser, berati tempat semulanya igin
//           // kayak gimana

//           // biasanya opacitynya dikurangin
//           childWhenDragging: Opacity(
//             opacity: 0.3,
//             child: Icon(Icons.apple, color: Colors.red, size: 80),
//           ),

//           // ini adalah icon awal atau widget awal yang bisa diseret
//           child: Icon(Icons.apple, color: Colors.red, size: 80),
//         ),

//         SizedBox(height: 50),

//         // DRAG TARGET
//         DragTarget<String>(

//           // disini itu validasinya
//           onWillAcceptWithDetails: (data) {
//             return data.toString() == "Apel Merah"; // hanya terima "Apel Merah"
//           },

//           // disini ketika diterima, datanya maka mau diapakan
//           onAcceptWithDetails: (data) {
//             setState(() {
//               hasilDrop = data.toString();
//             });
//           },
//           builder: (context, candidateData, rejectedData) {
//             return Container(
//               height: 120,
//               width: 120,
//               color: candidateData.isNotEmpty ? Colors.green : Colors.grey,
//               child: Center(
//                 child: Text(
//                   candidateData.isNotEmpty ? 'Lepaskan!' : 'Drop di sini',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             );
//           },
//         ),

//         SizedBox(height: 30),
//         Text('Hasil Drop: $hasilDrop'),
//       ],
//     );
//   }
// }


// penjelasannya
// Draggable<T>({
//   // Data yang dibawa saat drag dimulai. T adalah tipe data generic.
//   required T data,

//   // Widget yang akan ditampilkan sebagai elemen yang bisa diseret.
//   required Widget child,

//   // Widget yang akan muncul saat widget sedang diseret.
//   required Widget feedback,

//   // Widget pengganti saat sedang menyeret. Biasanya berupa child dengan efek transparan.
//   Widget? childWhenDragging,

//   // Posisi anchor feedback saat drag. 
//   // Jika pointer: feedback mengikuti posisi jari.
//   // Jika child: feedback mengikuti posisi child.
//   DragAnchor dragAnchorStrategy = DragAnchor.child,

//   // Posisi offset dari feedback terhadap pointer.
//   Offset feedbackOffset = Offset.zero,

//   // Apakah widget ini dapat diseret atau tidak.
//   bool maxSimultaneousDrags = 1,

//   // Callback saat pengguna memulai drag.
//   void Function()? onDragStarted,

//   // Callback saat pengguna melepaskan dan diterima oleh DragTarget.
//   void Function()? onDragCompleted,

//   // Callback saat pengguna melepaskan, tapi tidak diterima oleh DragTarget.
//   void Function(Velocity velocity, Offset offset)? onDraggableCanceled,

//   // Callback saat drag berakhir (baik berhasil atau tidak).
//   void Function(DraggableDetails details)? onDragEnd,

//   // Memberikan sistem pengenalan gestur.
//   HitTestBehavior? hitTestBehavior,

//   // Key widget.
//   Key? key,

//   // Apakah data tetap muncul saat sedang diseret.
//   bool ignoringFeedbackSemantics = true,

//   // Digunakan untuk membuat efek visual semantik lebih lengkap untuk accessibility.
//   String? semanticsLabel,

//   // Apakah feedback juga diberi efek Semantics untuk accessibility.
//   bool excludeFromSemantics = false,
// })


// DragTarget<T>({
//   // Membangun tampilan widget berdasarkan status drag (sedang hover, sedang menerima, dll)
//   required Widget Function(
//     BuildContext context,
//     List<T?> candidateData,
//     List<dynamic> rejectedData,
//   ) builder,

//   // Callback yang dipanggil ketika ada draggable mendekat.
//   bool Function(T? data)? onWillAccept,

//   // Callback ketika data dilepas di atas DragTarget dan diterima.
//   void Function(T data)? onAccept,

//   // Callback ketika data tidak diterima dan keluar dari DragTarget.
//   void Function(T? data)? onLeave,

//   // Key widget
//   Key? key,
// })
