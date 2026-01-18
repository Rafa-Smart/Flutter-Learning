import 'package:belajar_flutter/providers/cart-provider-1.dart';
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
    final product = Provider.of<ProductProviderState>(context).allProducts
        .firstWhere((data) {
          // disni kita ambil dta yang id nya dalah productId yang dikirim dari arguments
          return data.id == productId;
        });

    // fdisini kita akan akses atau emngambil data dari provider tapi listenya itu false aja
    // karena kita hanya akses fugnsi
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('ini appbar')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: GridTile(
                child: Image.network(
                  product.imageUrl.toString(),
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error);
                  },
                ),
              ),
            ),
            Text('ini adalah detali page product id: ${product.id}'),
            SizedBox(height: 10),
            Text('ini adalah detali page product title: ${product.title}'),
            SizedBox(height: 10),
            Text(
              'ini adalah detali page product descption: ${product.description}',
            ),
            SizedBox(height: 10),
            Text('ini adalah detali page product price: ${product.price}'),
            SizedBox(height: 10),
            Text('ini adalah detali page product img: ${product.imageUrl}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // nah ketika mau di tambahkan kita mau coba unuk tampilakn snackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('product sudah di tambahkan ke cart'),
                    duration: Duration(seconds: 500),
                  ),
                );
                cartProvider.addCart(
                  productId: product.id.toString(),
                  title: product.title.toString(),
                  price: product.price.toString(),
                  qty: 1,
                );
                print(cartProvider.items);
              },
              child: Container(
                decoration: BoxDecoration(
                  
                ),
                width: 100,
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                  Icon(Icons.add),
                  Text("add cart")
                ],),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
