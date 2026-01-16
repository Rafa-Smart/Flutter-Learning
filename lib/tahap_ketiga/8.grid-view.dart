import 'package:flutter/material.dart';
import 'dart:math';
// ini contoh grid yang beragam
// wajib lihat kalo lagi baca file ini
// https://chat.deepseek.com/a/chat/s/0ddd2c5e-e7a0-4dbc-97ed-07cf50d41945

// kalo yang GridView.count itu tidak membutuhkan gridDelegate
// jadi atur jumlahnya itu lanugn

// dan gridDelegate itu bisanya isinya SLIVER....

// ada uga yang kaya gini
// jadi ini mah baakalh kaya wrap
// jadi lebarnya kna kalo grid itu di atru dari max count crossnya
// tapi dnegnaini kita bisa menetapkan ukuran lebarnya -> KALO AXIS VERTICAL

// jadi nnati perbarisnya itu akna menyesuailkan device
// 

// GridView.extent(
//   maxCrossAxisExtent: 150, // Lebar maksimal item
//   children: List.generate(10, (index) {
//     return Container(
//       color: Colors.green,
//       margin: EdgeInsets.all(10),
//       child: Center(child: Text('Item $index')),
//     );
//   }),
// )

// Dibandingkan ListView yang hanya menampilkan satu item per baris, GridView dapat menampilkan beberapa item dalam satu baris, sehingga lebih hemat ruang dan user dapat melihat lebih banyak item sekaligus.

// jadi lazy dn ketika sudah tidak terlihat dia akan di destroy dna ketika item baru muncul karena sscrol
// maka akn baru di load itemnya
// Hanya item yang berada dalam visible area yang dibangun (di-render). Saat user scroll, item yang keluar dari viewport di-destroy dan item yang masuk dibangun.
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("hello ini grid")),
        body: MyGrid(),
      ),
    );
  }
}

class MyGrid extends StatefulWidget {
  @override
  _MyGridState createState() => _MyGridState();
}

class _MyGridState extends State<MyGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FloatingActionButton(
          onPressed: () {
            setState(() {});
          },
          child: Icon(Icons.circle_sharp),
        ),

        // Flutter tidak bekerja dengan ukuran absolut, tetapi dengan constraint.
        // jadi gini si grid ini itu butuh tau tinggi viewport
        // agar tau bisa ketika di scroll
        // dan widget yang scrollable itu butuh tau viewport

        // sedangkan kalo column itu dia aan nagsih tinggi tak terbatas kepada childrennya
        // meskupin widthnya tetap ketauan viewportnya dan ini mnejadi maslah bargi row
        // (kebalika dari column)

        // makanya kita buth expanded karena expanded akan mengambil sisa yang tersedia
        // setelah ukruan pada children itu sebagian pertamanya sduah
        // diambil oleh si floatingbutton
        // Karena GridView adalah widget scrollable yang membutuhkan batas ukuran (bounded constraint), sedangkan Column memberi constraint tidak terbatas pada sumbu utama.

        // GridView adalah:
        // https://chatgpt.com/c/6968ae15-9824-8322-bf5d-5f89edc8d3f8
        // Scrollable widget
        // Dibangun di atas Viewport + Sliver
        // Scrollable WAJIB tahu tinggi viewport-nya, supaya:
        // tahu area yang visible
        // tahu item mana yang harus dirender
        // tahu kapan destroy & build item
        // Jika tinggi tak terbatas, Flutter bingung:
        // Viewport setinggi apa?
        // Scroll terhadap apa?

        // Expanded berkata ke Column:
        // “Ambil sisa ruang vertikal yang tersedia,
        // lalu berikan constraint tinggi yang PASTI ke child.”
        Expanded(
          child: GridView(
            // atau bisa juga gini ya
            // berai nanti di abwah ini yang main dan crossnya akn ketukar
            // PENGINT TUH JADI KETUKAR, JADI SESUAI DENGAN AXIS
            // scrollDirection: Axis.horizontal,
            physics:   BouncingScrollPhysics(),
            // jadi ini tuh fungsinya agar tiap baris itu hanya 2 saja
            // karena in withCrosAxis
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,

              // ingat ini tuh ukuran main axis jadinya ini tuh kaya tinggi pada tiap
              // itemnya
              // kalo kalo lebar / width itu sudah diatur oleh si crossAxisCount

              // tapi aklo engga di pake nanti akan menyesuaikan ukurannya
              // mainAxisExtent: 50,

              // aspek rasio antara  corss / width dan main / hiight
              // dan defaultnya itu satu banding satu antara height dan widthnya
              // jadi kalo itemmnya itu kita custom misal pake container itu ga bisa
              // jadi harus dari sini
              // atau aklo tingginya mau di ataru bsia pake mainAxisExtends
              // kalo widthnya udah ada di crossAxisCont ya
              // childAspectRatio: 4/3
              // jadi x dulu baru y
              // berati lebarnya 4 dan tingginya 3
            ),
            children: [
              ...List<Widget>.generate(
                110,
                (index) => AnimatedContainer(
                  decoration: BoxDecoration(

                    // INGAT KALO KITA PUNYA COLOR DI LUAR DECORATION
                    // KITA GA BOLEH PAKE DECORATION
                    // MAKANYA KALO COLOR ITU MENIGNDI DALAM DECORATION AJA
                    // https://chatgpt.com/c/6968bbdb-c1b4-8324-8429-219d21129129
                    // Aturan Mutlak Container / AnimatedContainer
                    // color DAN decoration TIDAK BOLEH dipakai bersamaan
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromARGB(
                      255, // a -> ini tuh ke visibelan atau terlihat apa engga, artinya ini 100 % terlihat
                      Random().nextInt(256),
                      Random().nextInt(256),
                      Random().nextInt(256),
                    ),
                  ),
                  duration: Duration(milliseconds: 111),

                  // jadi next int itu artinya nilai terakhirnya tika akan di pake
                  // /jad misal 222, maka asilnya akna random pada 221
                  child: Center(child: Text('data ${index}')),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
