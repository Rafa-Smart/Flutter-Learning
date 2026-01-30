// ini legnkap banget
// https://chat.deepseek.com/a/chat/s/5d84e937-84f1-45f8-a970-93eee2d09365

import 'package:belajar_flutter/providers/cart-provider-1.dart';
import 'package:belajar_flutter/providers/products-state-manajement-1.dart';
import 'package:belajar_flutter/screens/cart-screen-1.dart';
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

    // nah disni ktia akna pakai multiProvider

    return MultiProvider(
      providers: [
        // nah disini itu ktia masuak provider provider yang kita perlukan
        // gitu
        ChangeNotifierProvider(create: (context) => ProductProviderState()),
        // nah conext nya in untuk si Cartprovider
        // jadi bukan akses context yang ada di atas / Widget build
        // coba aja yang sana hapus, nanti tidka akan error

        // jadi kalo create / builder itu artinya buat context abru
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          primaryColor: Colors.indigo,
          
          textTheme: TextTheme(
            bodyMedium: TextStyle(fontFamily: 'Lato'),
            bodyLarge: TextStyle(fontFamily: 'Lato'),
            bodySmall: TextStyle(fontFamily: 'Lato'),
            displayMedium: TextStyle(fontFamily: 'Lato'),
            headlineMedium: TextStyle(fontFamily: 'Lato'),
          ),
          appBarTheme: AppBarThemeData(
            titleTextStyle: TextStyle(fontFamily: 'Lato',color: Colors.white, fontSize: 35),
          ),
        ),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
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

// class StateManajement1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // disi kita set agar si Materialini di bungkus oleh si ChangerNotifierProvider


//   // nah disni
  
//     return ChangeNotifierProvider(
//       create: (context) => ProductProviderState(),
      
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'MyShop',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           primaryColor: Colors.indigo, fontFamily: 'Lato'),
//         routes: {
//           ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
//         },

//         // nah jadigini siwidget productDetialSrceen ini sudha emndengarkan si
//         // product provider ini

//         // tapi gini yang butuh provider ini engga hanya si everview screen
//         // dapi si detial juga, makanya ktia butuh di uga di bunkug
//         // oleh provider

//         // tapi lebih baik kia bungkusnya iu di parenny lagi aa yaiu di mateiral
//         // home: ChangeNotifierProvider(
//         //   create: (context) => ProductProviderState(),
//         //   child: ProductOverviewScreen(),
//         // ),
//         home: ProductOverviewScreen(),
//       ),
//     );
//   }
// }
