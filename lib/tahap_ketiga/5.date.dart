import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ini app bar')),
        body: Center(
          // jadi ktia akna format agar dari data datetime.now
          // yang dimana ini akan mengembalikan date yang lengkap

          // maka disini kita hanya ingin emgambil day nya saja
          // jadi gini
          child: Text(
            DateFormat.d().add_EEEE().format(DateTime.now()),
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
