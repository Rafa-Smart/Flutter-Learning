import 'dart:math';

import 'package:belajar_flutter/models/product-state-manajement-1.dart';
import 'package:belajar_flutter/widgets/product-item-state-manajement-1.dart';
import 'package:flutter/material.dart';

class ProductOverviewScreen extends StatelessWidget {
  // disni ktia mapping data product pake model Product
  final List<Product> products = List.generate(20, (index) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ini appbar'),),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3/2 // x nya 3 dan y nya 2
        ),
        itemBuilder: (context, index) {
          //tanda ! artinya itu harus ada 

          return ProductItem(id: products[index].id!, title: products[index].title!, imageUrl: products[index].imageUrl!);
        },
      ),
    );
  }
}
