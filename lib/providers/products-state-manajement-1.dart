// ini legnkap banget
// https://chat.deepseek.com/a/chat/s/5d84e937-84f1-45f8-a970-93eee2d09365

// jadi ingat ya untuk menapatkan sebuah provider atau misal kita mau askes
// materaial context (navigator) atau scaffold context (drawer)

// maka kalo ktia ga punya context dalam widget tersebut, maka widgte tersebut
// itu ktia bungkus dnegen LayoutBuilder, jadi dia akn memberikna saya context
// dan nanti context ini akna terus mencari ke atas

import 'dart:math';

import 'package:belajar_flutter/models/product-state-manajement-1.dart';
import 'package:flutter/material.dart';

class ProductProviderState extends ChangeNotifier {
  final List<Product> _allProducts = List.generate(25, (index) {
    return Product(
      id: "id_${index}",
      title: 'title_${index}',
      description: 'description_${index}',
      // disini kenapa kita stirngkan dulu
      // karena fungsi parse ini butuh stirng
      price: double.parse(Random().nextInt(20).toString()),
      imageUrl: 'https://picsum.photos/id/${index + 10}/200/300',
    );
  });

  // disni ktia akan buat getternya
  // List<Product> get allProducts {
  //   return _allProducts;
  // }
  // jadi dia itu ga perlu paramater
  List<Product> get allProducts => _allProducts;

  // bisa nih untuk setter
  // void set pasdsad(as){

  // }
}
