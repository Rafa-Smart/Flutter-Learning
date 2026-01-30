import 'dart:math';

import 'package:belajar_flutter/models/product-state-manajement-1.dart';
import 'package:belajar_flutter/providers/cart-provider-1.dart';
import 'package:belajar_flutter/providers/products-state-manajement-1.dart';
import 'package:belajar_flutter/screens/cart-screen-1.dart';
import 'package:belajar_flutter/widgets/badge-1.dart';
import 'package:belajar_flutter/widgets/product-grid-1.dart';
import 'package:belajar_flutter/widgets/product-item-state-manajement-1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // karena di materialnya ita udha pasang change notifier makanya
    // disni ktia bsia untuk mengambil data providenya
    final product = Provider.of<ProductProviderState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('ini appbar'),
        centerTitle: true,
        flexibleSpace: Container(color: Colors.blue),
        actions: [
          // nah disini itu ktia ga perlu pake Provider.of(context)
          // tapi kitaakna menggunakan Consumer karena dia akna berubah ubah
          // jadi kalo berubah maka hanya widgt Badge ini aja yang rebuild
          Consumer<CartProvider>(
            builder: (context, value, child) {
              return MyBadge(
                child: IconButton(
                  onPressed: () {
                    // disni ketika kita klik maka kita akna pindah halaman
                    // Navigator.push
                    // gausah pake arguments
                    Navigator.pushNamed(context, CartScreen.routeName);
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
                value: value.sumItems.toString(),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Stack(
          children: [
            // ini ga perlu pake expanded juga bisa ya
            // karena ini tuh pake stack

            // nah disni itu ad adi widget ya
            ProductGrid1(),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () async {
                  final result = await _showDialog(context);
                  if (result['isAdd']) {
                    product.addProduct(product: result['data']);
                  } else {}
                },
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ini build context dari si ProductOverviewScreen
Future<Map<String, dynamic>> _showDialog(BuildContext context) async {
  // TextEditingController nameProduct = TextEditingController();
  // gausha pake itu ya soalnya ini tuh buka n yang biasa, ini mah text filed jadi hanya inputan aja

  String data = '';

  bool siAdd = false;
  siAdd = await showDialog(
    context: context,
    builder: (contextDialogCurrent) {
      return AlertDialog(
        title: Text('Add Product'),
        content: TextField(
          onChanged: (product) {
            data = product;
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text("batal"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text("tambah"),
          ),
        ],
      );
    },
  );
  return {'isAdd': siAdd, 'data': data};
}
