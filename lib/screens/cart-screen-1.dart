import 'package:belajar_flutter/providers/cart-provider-1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  // naha route untuk screen ini

  static const routeName = '/carts';

  // disni ktia pake provider aja
  // karena bnayka yang mau kita pake dari provider 
  // tapi disni ktia false kan aja listennya


  @override
  Widget build(BuildContext context) {
  final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Carts"),
        centerTitle: true,
        flexibleSpace: Container(color: Colors.blue),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'total price : \$ ${cart.totalPriceAllCart}',
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                print({cart.items.values.toList().toString()});
                return ListTile(
                  contentPadding: EdgeInsets.all(5),
                  leading: Icon(Icons.shop),
                  // jadi cart.items adalah objek, jadi ktia ingin ambil
                  // data valuesnya aja, nah setelah dapet tuh
                  // array isi array nah jadi kita ambil berdasarkan indecnya
                  // lalu kita ambil title
                  // {[Instance of 'CartItem', Instance of 'CartItem']}

                  // atau nanti ktai tanya ai aja

                  title: Text(cart.items.values.toList()[index].title),
                  subtitle: Text(cart.items.values.toList()[index].qty.toString()),
                  trailing: Container(
                    child: Text(cart.items.values.toList()[index].price.toString()),
                  ),
                );
            },),
          )
        ],
      ),
    );
  }
}
