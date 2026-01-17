// import 'package:belajar_flutter/screens/product-detail-screen-state-manajement-1.dart';
// import 'package:flutter/material.dart';

// class ProductItem extends StatelessWidget {
//   final String id;
//   final String title;
//   final String imageUrl;

//   ProductItem({required this.id, required this.title, required this.imageUrl});

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(10),
//       child: GridTile(
//         child: GestureDetector(
//           onTap: () {
//             Navigator.of(
//               context,
//             ).pushNamed(ProductDetailScreen.routeName, arguments: this.id);
//           },
//           child: Image.network(
//             this.imageUrl,
//             fit: BoxFit.cover,
//             errorBuilder: (context, error, stackTrace) {
//               return Icon(Icons.person);
//             },
//           ),
//         ),
//         footer: GridTileBar(
//           backgroundColor: Colors.black54,
//           leading: IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.favorite_border_outlined),
//             color: Theme.of(context).primaryColorLight,
//           ),
//           title: Text(title, textAlign: TextAlign.center),
//           trailing: IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.shopping_cart),
//             color: Theme.of(context).primaryColorDark,
//           ),
//         ),
//       ),
//     );
//   }
// }

// ini yng pake provider
import 'package:belajar_flutter/models/product-state-manajement-1.dart';
import 'package:belajar_flutter/screens/product-detail-screen-state-manajement-1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // nah disini ktia pake provider aja
    // ingat ya si model product ini adlah model yang sebagai provider juga

    // nah ingat ya
    // disni itu si Product dia itu udah tunggal ya
    // karena emang kita udah panggil dia berdasarkan jumlah indexnya
    // jadi kita bsia akses aja si Product ini

    // jadi product ini punya id, title, dll
    final Product product = Provider.of<Product>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(
              context,
            ).pushNamed(ProductDetailScreen.routeName, arguments: product.id);
          },
          child: Image.network(
            product.imageUrl.toString(),
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.person);
            },
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            onPressed: () {
              product.toggleIsFavorite();
              print(product.isFavorite);

              // jadi tiap di klik itu kita toggle
              // jadi kal lagi true maka kan nanit it jadi !isFavorite
              // maka akn kebalikanna
            },
            icon: Icon(
              product.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
            ),
            color: Theme.of(context).primaryColorLight,
          ),
          title: Text(product.title.toString(), textAlign: TextAlign.center),
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
