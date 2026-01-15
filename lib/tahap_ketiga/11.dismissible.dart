import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // disin ga papa kita pakein dia context
    // tapi context untuk halaman pertama itu nanti untuk
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // nah gini, misla di materialapp itu dia punya theme
    // kan untuk aksesnya itu kita butuh cntext
    // nah ktia bisa menggunakna context yang ada di widget ini / homePage
    // karena nanti dia akna ada di home kan
    // nah dnegna dia mempunyai context ini dia akn punya akses ke parentnya
    // jadi dia bisa akses si theme milik si APp widget
    // nah karena context kita ayng ad adi homepage ini ada dibawha
    // si material app
    // makanya kita bisa akses si themenya
    // https://gemini.google.com/app/ca84a51a5983ff2c
    // tuh lihat

    return Scaffold(
      appBar: AppBar(title: Text('ini app bar'), centerTitle: true,),
      body: Center(),
    );
  }
}
