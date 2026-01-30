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
import 'package:belajar_flutter/providers/cart-provider-1.dart';
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

    // ingat ya, in kita bisa akses povider dari Product
    // karena di product-grid-1 dia si widget ProductItem in
    // telah di bungkus dnena changenotifier untuk tiap tiap productItem ini, makanya dia bisa akses provider product disni
    // final Product product = Provider.of<Product>(context);

    // disni cobakita kana menggunakan Consumer ->
    // dia ini akna selalu melisten

    // kan kalo yang sebelumnya itu bisa kita kasih parmaeter lister:false
    // ini tuh misa untuk akses fugsi

    // nah disni kita akn menggunakan Consumer
    // disni yang hanya mencnsum itu si icon favorite sja
    // makanay untuk widgetyang selalu beruab uabh akrena dia selalu mendengar perubahan
    // kita bungkus dia dnegn consumer

    // tapi untuk ang sekali aja misal dan dia tidak berubah ubah
    // maka kita pake ini tetep
    // tapi kita set dia listennya jadi false
    final Product product = Provider.of<Product>(context, listen: false);

    // disini kita juga butuh Provider dari si cart
    // dan ingat dia itu kita pasang false aja
    // tapi kalo misaakn kita mau buat dia pake isAddCart di product
    // bisa juga, tapi nanti aja itu mah
    // TODO buatkan saya isAddCart di product model

    // disni false aja karena ya hanya sekali
    // karena dsini kita panggil karena ita ignin megambil fugnisnya aja
    // akanya kalo hanya akses fungsi lebih baik false aja
    // jadi ga listen terus menerus

    final CartProvider cart = Provider.of(context, listen: false);
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

            // ini dia widget yang harus selalu mendengar perubahan dari provider
            // nah diatas kan kita udha set providernya itu engga selali listen
            // jadinya sekarnag kalo ad aperubahan maka data di sini tidak akna di rubah
            // nah makanya disni ktia bunkus lagi aja dnegn consumer
            // nah consumer ini itu dia akna sealu listen tapi enaknya dia bisa hanaya
            // membungkus widget widget yang emnag perlu selalu mendengar
            // misalnya isFavorite ini
            // dia harus tau ketika perubahan di kli atau engga, false atau engga
            icon: Consumer<Product>(
              builder: (context, value, child) {
                // nah jadi keitka ada erubahan unutk provider ini
                // maka hanya widge Icon ini yang berubah
                return Icon(
                  value.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                );
              },
            ),
            color: Theme.of(context).primaryColorLight,
          ),
          title: Text(product.title.toString(), textAlign: TextAlign.center),
          trailing: IconButton(
            onPressed: () {
              // nah ketika mau di tambahkan kita mau coba unuk tampilakn snackBar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('product sudah di tambahkan ke cart'),
                  duration: Duration(milliseconds: 500),
                ),
              );
              cart.addCart(
                productId: product.id.toString(),
                title: product.title.toString(),
                price: int.parse(product.price.toString()),
                qty: 1,
              );
              print(cart.items);
            },
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).primaryColorDark,
          ),
        ),
      ),
    );
  }
}
