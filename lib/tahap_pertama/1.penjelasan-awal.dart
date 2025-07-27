import 'package:flutter/material.dart';

// jadi cara nyipen data di flutter itu pake tree
// mirip kayak di js
// https://chatgpt.com/c/6884ea8c-9d5c-8009-b8f8-afaaabe37926

// Flutter = Framework UI berbasis widget.
// Widget = Class → semua UI adalah objek dari class tertentu.
// Setiap UI dideklarasikan dan dikontrol melalui konsep OOP seperti
// inheritance, polymorphism, encapsulation, dan abstraction.

// nah jadi seluruh widget itu akna mengebalikan objek
// nah sma juga kayak Text, dia adlah widget
// dan dia mengembalikan objek Text
// yang seharusnya didalam class Text ini terdapat
// fungsi build yang return objek

// nih lihat, ini isinya
class Text extends StatelessWidget {
  final String data;

  const Text(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(text: data, style: DefaultTextStyle.of(context).style),
    );
  }
}

void main() {
  // nah disini
  // ada fungsi untuk menjalankan aplikasi yaitu runApp()
  // runApp();
  // nah param di dalam myApp ini itu harus menjalankan
  // sebuah class, adi bisa new namaClass
  // atau langsung sja namaClass

  // jadi classnya ini harus mereturn sebuah objek widget
  // nah objek widget ini lah yang digunakan di runApp
  runApp(myApp());
}

class myApp extends StatelessWidget {
  // jadi kita akan menurunkan seluruh property dari statewidget
  // kemudian disini kita wajib mengovveride fungsi build yang ada di parentnya

  @override
  Widget build(BuildContext context) {
    // jadi material ini adalah pembungkusnya
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ini adalah appBar')),
        body: Center(child: Text('ini adalah body')),
      ),
    );
  }
}

// jaid gini strukturnya
// MaterialApp({
//   required Widget home,
//   ThemeData? theme,
//   Map<String, WidgetBuilder>? routes,
//   String? initialRoute,
//   ...
// })
