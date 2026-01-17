import 'package:belajar_flutter/screens/product-detail-screen-state-manajement-1.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem({required this.id, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(
              context,
            ).pushNamed(ProductDetailScreen.routeName, arguments: this.id);
          },
          child: Image.network(this.imageUrl, fit: BoxFit.cover),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black26,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border_outlined),
            color: Theme.of(context).primaryColorLight,
          ),
          title: Text(title, textAlign: TextAlign.center),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ),
    );
  }
}
