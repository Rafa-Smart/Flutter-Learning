import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(title: Text('ini appbar'),),
        body: Stateful()
      )
    );
  }
}

class Stateful extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Stateful> {

  final TextEditingController panjang = TextEditingController();
  final TextEditingController lebar = TextEditingController();
  var hasil;

  void hitung(){
    setState(() {
      hasil = (double.parse(panjang.text) * double.parse(lebar.text));
    });
  }

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.red
        ])
      ),
      child:Center(
        child: Column(
          children: [
            TextField(
              controller: panjang,
              decoration: InputDecoration(
                labelText: "panjang",
                prefixText: "Panjang:"
              )
            ),
            TextField(
              controller: panjang,
              decoration: InputDecoration(
                labelText: "lebar",
                prefixText: "lebar:"
              )
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: null,
              child: Text('Hitung'),
            ),
            SizedBox(height: 20,),
            Text('Hasil: ')
          ],
        ),
      )
    );
  }
}