// https://chat.deepseek.com/a/chat/s/a18e8f2a-8da7-4cd0-a20a-fcd821e9d51f/
// ini jelas bange pejelasnanya
// wajib bca

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

        return ChangeNotifierProvider.value(
          //  ChangeNotifierProvider.value (menggunakan value)
          // Digunakan ketika kita sudah memiliki instance dari ChangeNotifier yang sudah dibuat sebelumnya.

          // Provider ini tidak akan meng-dispose instance yang diberikan saat provider dihapus dari widget tree.

          // Biasanya digunakan ketika instance ChangeNotifier sudah ada (misal: dari parent provider) dan kita ingin membagikannya ke bagian lain di widget tree.

          // PENJELASAN AI lgi
          // Dalam kasus Anda, Product instance sudah dibuat dan dikelola oleh ProductProviderState (dalam list _allProducts). Ketika ProductGrid1 melakukan rebuild (misal karena penambahan item), jika menggunakan ChangeNotifierProvider dengan create, maka setiap item akan membuat instance baru dari Product untuk index yang sama. Ini menyebabkan:

          // Instance sebelumnya akan di-dispose (karena provider lama dihapus).

          // Instance baru dibuat dengan state yang di-reset (misal: isFavorite kembali ke false).

          // Tapi, instance lama mungkin masih dipegang oleh widget lain (misal: jika ada animasi atau transisi) sehingga ketika ada pemanggilan method (seperti toggleIsFavorite), akan error karena instance sudah di-dispose.

          // Dengan menggunakan .value, kita menggunakan instance yang sudah ada dari list, sehingga tidak ada pembuatan baru dan tidak ada dispose yang tidak diinginkan.
          // Flutter punya VIEWPORT (area yang terlihat)
          // Widget yang KELUAR viewport → di-dispose (untuk hemat memori)
          // Widget yang MASUK viewport → dibuat baru (recreate)

          // // Dengan `ChangeNotifierProvider` (create):
          // Ketika widget di-dispose → Provider ikut di-dispose
          // Ketika widget dibuat lagi → Provider BARU dibuat
          // → TAPI DATA PRODUCTnya SAMA! (dari _allProducts)
          // → Jadi kita buat provider baru untuk data yang sama

          // INI PENTING DARI SAYA

          // {
          //   ini penjesan .VALUE DAN TIDAK

          // /jadi gini ketika punya data allProducts -> 25
          // lalu tipa tiap itemnya kita jadikan dia sebuah provider
          // kedalam ProductItem(yang melisten)

          // error pertama :
          // nah ketika kita tambah data produk ke ProductProviderState
          // maka diakan di fungsi addProduct iu pake notifyListener
          // naha makanya dia akan rebuild ulnag
          // ketika rebuild ulang otomatis dia akn mendidpose / menghapus
          // dta 25 yang pertmaa, nah mungkin karen delay gitu di Productitem
          // dia masih memgang referensi ke objek 25 sebelumnya (yag udah di apus)
          // maka ketiak kita mau klik favorite providernya yang lama kan ialng
          // nah dia akn error

          // error kedua
          // ketika kita scroll, si grid ini itu akna mendispose data ayang sudah
          // tidak terlihat di viewport
          // nah makanay ketika kita scroll lagi ke atas
          // data yang udah kehapus tadi tuh pengan kit aliat lagi
          // tapi udah engga ada
          // jika kita menggunakan ChangeNotifierProvider dengan create, maka saat widget di-dispose, provider juga akan di-dispose.

          // Padahal, provider tersebut (objek Product) masih ada di dalam list _allProducts di ProductProviderState. Jadi, kita kehilangan provider untuk item tersebut.

          // solusi
          // makanya disini kita membutuhkan ChangeNotifierProvider.value
          // yang fungsinya itu untuk membagikan provider per item didalam provider
          // yang memiliki allProducts

          // jadi ktia akna menggunakan data yang sudah ada
          // kita kan udah punya data list of provider
          // nah kita tinggal bagginn aja ke tia ProductItem
          // dn si provider yang tunggal ini ga berhak untuk dispose
          // karen ayang berhak dispose itu hanya yang punya listnya
          // dan kalo pake ini, kita tidak akna emndispose data ketika sudah scroll
          // atau ketika tambah data
          // karena seharusnya kalo kita mau dispose data untuk iilangin data
          // itu harus di lakukan di provider yang punya allproducts
          // bukna productProvider

          // jadi gini keika kta pake method create maka ini artinya
          // rprovider ini akna di dispose inagat povider bukan objeknya
          // misal ketika rebuild -> (contoh : tamabh data baru)
          // tapi ketika kita menggunakan value
          // maka dia tidak akan mendispose ketika ada rebuild
          // dan dia tidka akna menggunakan method create tapi value
          // }

          // ini penjelsabiasa
          // jadi gni disini tuh, si changenotifier ini tuh kan dia akna melakukan 2 hal
          // yaitu mereturn sebauh child yang akan selalu emdengar perubahan dari state nya yang dair provider
          // kemudian akna membuat atua emndefinisikan bahwa child tersebut itu
          // memiliki provider ata sedang mendengarkan provider yang mana

          // nah dalam kasus ini kita kan udah punya provider ProductProviderState
          // yang udah kita devinsiakn di tahap1 state-majement-1

          // dan ingat juga kita udah punya list bahwa ternyata tiap tiap elemen
          // dari allProducts adalah sebauh provider Product

          // nah makanya disni kita kan looping sebanyak item allProducts
          // disni kita buat tiap item dari ProductItem itu akan selalu mendengar
          // provider product per itemnya -> karena disni itu udah per item ya
          // product.allProducts[index]

          // nah berati si ProductItem ini bis mendapatkan data dari providernya dong
          // jadi makanya kita bisa panggil di ProductItem
          // final Product product = Provider.of<Product>(context);

          // dan itu adalah satu item aja ya
          // create: (context) => product.allProducts[index],

          // itu asalnya

          // tapi ini yang benr
          value: product.allProducts[index],

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


// test