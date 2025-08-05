// ini penjelasan yang snagat amat lengkapnya
// https://chatgpt.com/c/688de205-e110-8009-b0f6-11521dc433ff

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ini appbar')),
        body: Stateful(),
      ),
    );
  }
}

class Stateful extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Stateful> {
  final TextEditingController panjangLuas = TextEditingController();
  final TextEditingController lebarLuas = TextEditingController();

  final TextEditingController panjangKeliling = TextEditingController();
  final TextEditingController lebarKeliling = TextEditingController();
  var hasilLuas;
  var hasilKeliling;

  void hitungLuas() {
    setState(() {
      hasilLuas =
          (double.parse(panjangLuas.text) * double.parse(lebarLuas.text));
    });
  }

  void hitungKeliling() {
    setState(() {
      hasilKeliling =
          (double.parse(panjangKeliling.text) +
          (double.parse(lebarKeliling.text) * 2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.purple, Colors.pink]),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(colors: [Colors.blue, Colors.green]),
              ),
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                children: [
                  Text("Keliling Persegi", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      autofocus: true,
                      controller: panjangKeliling,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        labelText: "panjang",
                        prefixText: "Panjang:",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      controller: lebarKeliling,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        labelText: "lebar",
                        prefixText: "lebar:",
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: hitungKeliling,
                    child: Text('Hitung'),
                  ),
                  SizedBox(height: 20),
                  Text('Hasil keliling: ${this.hasilKeliling}'),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(colors: [Colors.blue, Colors.green]),
              ),
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                children: [
                  Text("Luas Persegi", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      controller: panjangLuas,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        labelText: "panjang",
                        prefixText: "Panjang:",
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      controller: lebarLuas,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        labelText: "lebar",
                        prefixText: "lebar:",
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: hitungLuas,
                    child: Text('Hitung'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Hasil luas: ${this.hasilLuas}'),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
