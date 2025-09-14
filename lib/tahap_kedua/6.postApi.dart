import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  @override
  MyState createState() {
    return MyState();
  }
}

class MyState extends State<MyApp> {
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  PostResult? Data = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            width: 500,
            height: 600,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    autofocus: true,
                    controller: username,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: "Username",
                      prefixText: "Username:",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    autofocus: true,
                    controller: email,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      prefixText: "Email:",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    autofocus: true,
                    controller: password,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      prefixText: "Password:",
                    ),
                  ),
                ),
                Container(
                  width: 400,
                  height: 200,
                  padding: EdgeInsets.all(8.0),

                  margin: EdgeInsets.symmetric(horizontal: 1, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "id: ${Data?.id ?? "ga ada"}",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "token: ${Data?.token ?? "ga ada"}",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    Data = await PostResult.ConnectToApi(
                      username,
                      email,
                      password,
                    );
                    setState(() {});
                  },
                  child: Text(
                    'Kirim Data',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// buat dulu class untuk post resultnya

class PostResult {
  final String id;
  final String token;

  PostResult({required this.id, required this.token});

  // membuat factorynya

  factory PostResult.createResult(Map<String, dynamic> object) {
    return PostResult(id: object['id'], token: object['token']);
  }

  // membuat fungis untuk connect ke api

static Future<PostResult?> ConnectToApi(
  TextEditingController username,
  TextEditingController email,
  TextEditingController password,
) async {
  Uri apiUrl = Uri.parse('https://reqres.in/api/register');

  var dataHasil = await http.post(
    apiUrl,
    headers: {
      "Content-Type": "application/json", // penting!
      "x-api-key": "reqres-free-v1"
    },
    body: json.encode({
            // body: {'username': username, 'email': email, 'password': password},
      "username": username.text,
      "email": email.text,
      "password": password.text,
      // karena kita kirimnya itu json
            // pake .text, karena kita butuhnya itu strin di http.postnya, tapi kita malah masukin
      // texteditingcontroller, jadi kita parse dulu
    }),
  );

  print("STATUS: ${dataHasil.statusCode}");
  print("BODY: ${dataHasil.body}");

  if (dataHasil.statusCode == 200) {
    final DataJson = json.decode(dataHasil.body);
    return PostResult.createResult(DataJson);
  } else {
    // kalau gagal
    return null;
  }
}

}

// test
// test