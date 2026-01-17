// ini legnkap banget
// https://chat.deepseek.com/a/chat/s/5d84e937-84f1-45f8-a970-93eee2d09365

import 'package:belajar_flutter/screens/product-detail-screen-state-manajement-1.dart';
import 'package:belajar_flutter/screens/product-overview-screen-state-manajement-1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(StateManajement1());
}

class StateManajement1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyShop',
      theme: ThemeData(primaryColor: Colors.indigo,fontFamily: 'Lato'),
      routes: {
        ProductDetailScreen.routeName: (context) => ProductDetailScreen()
      },
      home: ProductOverviewScreen(),
    );
  }
}
