// jadi igni ketiak ktia mau ubah su favorite ini
// ini kan tiap item ya, jadi kalo yang sbelurnya allProducts
// dia itu akn untuk semua nya
// nah abgaimana jika kita mau tiap tiap itemmnya
// itu dia punya statenya sendiri

// nah berati kita butuh bungkus si itemnya itu menjadi sebuah provider

// nah lalu dia mendengarnya itu dari mana ? nah dia itu nanti ngedengerinnya itu
// tiap tiap si itemnya gitu

// jadi nanti di product grid kita buat dia (pada tiap elemen nya)
// sebuah pedengar untuk tiap tiap itemya yang sudah menjadi provider gitu

import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,

    // kalo paramter yang reuqired itu ga bisa pake defualt value
    this.isFavorite = false,
  });

  // jadi ini tinggla di balik aja gitu
  void toggleIsFavorite() {
    // jadi tiap di klik itu kita toggle
    // jadi kal lagi true maka kan nanit it jadi !isFavorite
    // maka akn kebalikanna
    isFavorite = !isFavorite;

    // jangan lupa dinsi
    // kasih notifyListener
    notifyListeners();
  }
}
