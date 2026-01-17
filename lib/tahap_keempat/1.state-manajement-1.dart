// ini legnkap banget
// https://chat.deepseek.com/a/chat/s/5d84e937-84f1-45f8-a970-93eee2d09365

import 'package:belajar_flutter/providers/products-state-manajement-1.dart';
import 'package:belajar_flutter/screens/product-detail-screen-state-manajement-1.dart';
import 'package:belajar_flutter/screens/product-overview-screen-state-manajement-1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(StateManajement1());
}

class StateManajement1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // disi kita set agar si Materialini di bungkus oleh si ChangerNotifierProvider


  // nah disni
    return ChangeNotifierProvider(
      create: (context) => ProductProviderState(),
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(primaryColor: Colors.indigo, fontFamily: 'Lato'),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
        },

        // nah jadigini siwidget productDetialSrceen ini sudha emndengarkan si
        // product provider ini

        // tapi gini yang butuh provider ini engga hanya si everview screen
        // dapi si detial juga, makanya ktia butuh di uga di bunkug
        // oleh provider

        // tapi lebih baik kia bungkusnya iu di parenny lagi aa yaiu di mateiral
        // home: ChangeNotifierProvider(
        //   create: (context) => ProductProviderState(),
        //   child: ProductOverviewScreen(),
        // ),
        home: ProductOverviewScreen(),
      ),
    );
  }
}
