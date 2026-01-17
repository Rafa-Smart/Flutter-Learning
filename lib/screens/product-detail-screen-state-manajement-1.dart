import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    // nah ini untuk dapetin data argument dari pushNamed dari
    // si productItem
    // karnea dia itu ngasih argument id ke route ini
    final productId = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      body: Center(child: Text('ini adalah detali page product: ${productId}')),
    );
  }
}
