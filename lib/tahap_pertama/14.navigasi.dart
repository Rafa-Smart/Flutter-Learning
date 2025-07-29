// https://chatgpt.com/c/6888c219-3d40-8009-a543-f01f16e252bf#4

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/page2': (context) => Page2(),
        '/page3': (context) => Page3(),
      },
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text('push → Page2'),
            onPressed: () => Navigator.pushNamed(context, '/page2'),
          ),

          // klo ini berati nanti halaman sebelumnya ketika kita sudah sampai
          // pada halaman page 2 akan hilnag
          ElevatedButton(
            child: Text('pushReplacement → Page2'),
            onPressed: () => Navigator.pushReplacementNamed(context, '/page2'),
          ),
        ],
      ),
    );
  }
}


class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text('pop() → Kembali'),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: Text('push → Page3'),
            onPressed: () => Navigator.pushNamed(context, '/page3'),
          ),
          ElevatedButton(
            child: Text('pushAndRemoveUntil → Page3'),
            onPressed: () {

              // berati ketika kita pake ini
              // seluruh halaman sebelumnya sampai halaman page 3 ini
              // akan terhapus
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => Page3()),
                (route) => false, // hapus semua halaman sebelumnya
              );
            },
          ),
        ],
      ),
    );
  }
}


class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 3')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // ini berati akan terus di pop dari halaman sekarang
          // sampai halaman / -> root route
          ElevatedButton(
            child: Text('popUntil → Home'),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
          ),

          // kalo misalkan halaamn sebelumnya ada, maka kembali
          // jika tidak maka tidka bisa
          ElevatedButton(
            child: Text('maybePop'),
            onPressed: () => Navigator.maybePop(context),
          ),
          ElevatedButton(
            child: Text('popAndPushNamed → Page2'),
            onPressed: () => Navigator.popAndPushNamed(context, '/page2'),
          ),
        ],
      ),
    );
  }
}
