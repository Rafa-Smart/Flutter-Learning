import 'package:belajar_flutter/tahap_keempat/api-learning/viewmodels/post_viewmodels.dart';
import 'package:belajar_flutter/tahap_keempat/api-learning/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return PostViewmodels();
      },
      child: MaterialApp(
        title: 'HTTP Methods Tutorial',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        home: HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
