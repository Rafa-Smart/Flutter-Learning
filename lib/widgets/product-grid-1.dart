import 'dart:math';

import 'package:belajar_flutter/models/product-state-manajement-1.dart';
import 'package:belajar_flutter/providers/products-state-manajement-1.dart';
import 'package:belajar_flutter/widgets/product-item-state-manajement-1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid1 extends StatelessWidget {
  // disni ktia mapping data product pake model Product
  // final List<Product> products = List.generate(20, (index) {
  //   return Product(
  //     id: "id_${index}",
  //     title: 'title_${index}',
  //     description: 'description_${index}',
  //     // disini kenapa kita stirngkan dulu
  //     // karena fungsi parse ini butuh stirng
  //     price: double.parse(Random().nextInt(20).toString()),
  //     imageUrl: 'https://picsum.photos/id/${index + 10}/200/300',
  //   );
  // });

  // nah jadi ktia ga perlu lagi itu
  // tapi disni ktia pake aja data products nya itu dari provider

  // var products = [];

  @override
  Widget build(BuildContext context) {
    // nah disni itu ktia pake di sini karena kita butuh context ya
    // nah lalu ktia bisa menggunakan variable untuk menampung data dari provider

    // nah ini uh isinya si products adalah sebuah objek
    // yang atributnya itu adlah tiap fugnsi dan tiap variable yang ada
    // di provider ini
    final product = Provider.of<ProductProviderState>(context);

    // ini ga perlu pake expanded juga bisa ya
    // karena ini tuh pake stack
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: product.allProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 2, // x nya 3 dan y nya 2
      ),
      itemBuilder: (context, index) {
        //tanda ! artinya itu harus ada

        // nah disni ya
        // jadi kia buat akna agar tiap tiap eleennya ini sebuah pendengar
        // /karena ternyata tiap tiap elemen ini itu
        // kita sudha buatkan providernya


        // nah jadi gini, changeNotifier ini itu kan di parameter createnya
        // dia akan mereturnkan sebuah providernya
        // nah disni karena kita itu array
        // dan kita itu maunya di tiap tiap itemnya itu punya state sendiri di providernya

        // maka kan diawal juga kita sudha buat bahwa model product itu adalah sebua provider yang menyimpan state

        // nah begitu pula si allProducts -> dia adalah sebuah list
        // yang berisi model provider profuct

        // maka tepat sekalijadi misal untuk product yang id nya satu
        // akan mempunyai model provider product sendiri

        // lalu yang product id 2 akan mempunyai state provider model productnya
        // sendiri juga, dna begitu seterusnya

        // tanya aja ai ini mah annti beosk

        return ChangeNotifierProvider(
          create: (context) => product.allProducts[index],
          // jadi tiap si ProductItem ini adalh pendengar dari provider Product
          child: ProductItem(),
        );

        // ini sebelumnya

        // return ProductItem(
        //   id: product.allProducts[index].id!,
        //   title: product.allProducts[index].title!,
        //   imageUrl: product.allProducts[index].imageUrl!,
        // );
      },
    );
  }
}
