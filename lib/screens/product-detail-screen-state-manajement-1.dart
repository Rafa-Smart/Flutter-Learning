import 'package:belajar_flutter/providers/products-state-manajement-1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    // nah ini untuk dapetin data argument dari pushNamed dari
    // si productItem
    // karnea dia itu ngasih argument id ke route ini
    final productId = ModalRoute.of(context)?.settings.arguments;

    // disni kita ambil data productnya lengkap
    final product = Provider.of<ProductProviderState>(context).allProducts.firstWhere((data) {
      // disni kita ambil dta yang id nya dalah productId yang dikirim dari arguments
      return data.id == productId;
    });
    return Scaffold(
      appBar: AppBar(title: Text('ini appbar'),),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('ini adalah detali page product id: ${product.id}'),
          SizedBox(height: 10,),
          Text('ini adalah detali page product title: ${product.title}'),
          SizedBox(height: 10,),
          Text('ini adalah detali page product descption: ${product.description}'),
          SizedBox(height: 10,),
          Text('ini adalah detali page product price: ${product.price}'),
          SizedBox(height: 10,),
          Text('ini adalah detali page product img: ${product.imageUrl}'),
        ],
      )),
    );
  }
}
