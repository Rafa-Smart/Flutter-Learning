import 'package:belajar_flutter/models/cart-1.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  // disni ktia akan membuat mapping yang beriisi
  // /data data cart

  // /dissini key nya adlah String yaitu productId
  late Map<String, CartItem> _items;

  Map<String, CartItem> get items => _items;

  // disni kita but fungsi untuk tambah cart

  void addCart({
    required String productId,
    required String title,
    required String price,
    required int qty,
  }) {
    // jadi kita akna menambhkan produk ke cart dalam dua kondisi
    // yaitu
    // 1. sudha pernah di tambah -> tambah qty

    // dan disni kita asumsikan si _items ini ada ya pake !
    // tapi ita udah pake late dan di ataus itu ita ga pake lagi ?
    if (_items.containsKey(productId)) {
      // jika sudah ada
      // nah jadi kita akn update data berdasarkna keynya dulu di cari
      // berdsarkan id dari productId
      // lalu setelah sudah dapat
      // dia akna memasukannya kedalam callback
      _items.update(productId, (value) {
        // nah jadi disin value kan adalah objek ya
        // nah yang mau kita ubah itu hanya qtynya saja
        // maka
        return CartItem(
          id: value.id,
          title: value.title,
          price: value.price,
          // disni qty yang lama kita tambahkan 1
          qty: value.qty + 1,
        );
      });
    }
    // 2. belum pernah di tambah -> buat baru / tambah
    else {
      // nah gini dalam mapping itu ad afungsi putIfAbset
      // jadi jika keynya ada dalam map _items maka lalukan
      // tambah qty nya saja, jadi buat baru tapi
      _items.putIfAbsent(productId.toString(), () {
        // nah karena ini baut baru
        // maka kita buat dia si idnya itu adaalh datetime
        return CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          qty: qty,
        );
      });
    }

    // nah disni itu jangan lupa kita tambahkan notifyListener
    // jadi tiap perubahan itu mau itu update atau tambah baru
    // kita notify
    notifyListeners();
  }
}
