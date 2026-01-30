import 'package:belajar_flutter/models/cart-1.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  // disni ktia akan membuat mapping yang beriisi
  // /data data cart

  // /dissini key nya adlah String yaitu productId
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  // disni kita buat juga getter untuk jumlah dari si items
  int get sumItems {
    // ini ga perlu pake notifyListener ya
    return _items!.length;
  }

  // disni ktia buat getter lagi untuk total harga yang di kali qty
  // disni ga bisa ya
  // karena kalo reduce itu dia si acumulatornya adalah tipe objeknya
  // tipe objeknya adalah ya CartItem
  // https://chatgpt.com/c/696cc230-4c18-8320-9f64-a2532bc515c4
  // get totalPriceAllCart {
  //  var hasil = _items.values.reduce((acc, data){
  //   return acc + data.qty;
  //  });
  // }

  // makanya disni ktia akn pakai fold aja
  // jadi mirip kaya reduce, tpi dia si akumulatornya itu adlah
  // angka bukan tipe objek

  get totalPriceAllCart {
    // jadi gini ini kan map, nah jadi
    // si values ini akna ngembaliin data valuenya
    // jadi isinya adlah objek CartItem
    // lalu fold ini inisiasinya itu adalaha 0
    // lalu ada fungsi yang parameter pertamanya itu kaya accumulator di reduce
    // lalu yang kedua adaah objeknya

    var hasil = _items.values.fold(0, (total, item) {
      return total + (item.price * item.qty);
    });
    return hasil;
  }

  // coba kit pakai reduce, tapi kita udah pakai operator + ya di modelnya
  // ini ga bisa ya error, kalo mau tau penyebabnya adalah
  // https://chatgpt.com/c/696cc6ce-5554-8324-b694-2fa94afc635d
  // get totalPriceAllCartReduce {
  //   return _items.values.reduce((acc, item) => acc + item).qty;
  // }

  // disni kita but fungsi untuk tambah cart

  void addCart({
    required String productId,
    required String title,
    required int price,
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
