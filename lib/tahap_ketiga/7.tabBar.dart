import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// liat ini https://chat.deepseek.com/a/chat/s/086eb7b0-56e6-4301-a060-826b2e8204c3
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  // ini yang pake list
  Widget build(BuildContext context) {
    // jadi length ini itu maksudnay dalah kita punya berapa tab
    // DefaultTabController myController = DefaultTabController(length: 3, child: child)
    // nah karena dia butuh child dan childnya itu adlah si TabBar
    // maka langsung aja kita tulis di sna

    // ini yang pake list
    List<Tab> tabs = [
      Tab(
        // jadi si Tab ini butuh paling tidak satu antara child, text atau icon
        child: Text('tab satu', style: TextStyle(color: Colors.white)),
      ),
      Tab(
        child: Text('tab dua', style: TextStyle(color: Colors.white)),
        icon: Icon(Icons.add_a_photo),
      ),
      Tab(
        child: Text('tab tiga', style: TextStyle(color: Colors.white)),
      ),
    ];

    List<Widget> tabViews = [
      Center(
        child: Container(
          color: Colors.grey,
          width: 300,
          height: 300,
          child: Center(
            child: Text(
              'ini tab 1',
              style: TextStyle(fontSize: 20, color: Colors.black12),
            ),
          ),
        ),
      ),
      Center(
        child: Container(
          color: Colors.grey,
          width: 300,
          height: 300,
          child: Center(
            child: Text(
              'ini tab 2',
              style: TextStyle(fontSize: 20, color: Colors.black12),
            ),
          ),
        ),
      ),
      Center(
        child: Container(
          color: Colors.grey,
          width: 300,
          height: 300,
          child: Center(
            child: Text(
              'ini tab 3',
              style: TextStyle(fontSize: 20, color: Colors.black12),textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // disni lah ktia akna taruh defaultTabController

      // dan emang bestpracticenya itu disini ya
      home: DefaultTabController(
        
        // nah ini inisiasi untuk indexnya mau dimana
        // disini indexnya it dari 0
        initialIndex: 2,
        // dan kita perlu child dan jgua lengthnya
        // dan dnegna ini, kita ga perlu lagi untuk atur atur heighnya
        // di preferen yan di bottm
        // karena sudha di atur oleh widget TabBar yang ad adi botton
        length: tabs.length,
        child: Scaffold(
          // mungkin ktia juga bisa taruh di sini untuk controller DefaulttabController
          // tapi sayangnya appBar ini butuh preferred, jadi kita naik lagi ke atas yaitu di scaffold
          appBar: AppBar(
            // Namun, jika kita ingin menempatkan widget lain di bottom yang bukan
            //PreferredSizeWidget, maka kita perlu membungkusnya dengan PreferredSize untuk
            //menentukan ukurannya.
            title: Text('My Apps'),
            centerTitle: true,
            flexibleSpace: Container(color: Colors.lightBlue),

            // jai disini ga usah pake preferen lagi karena tabBar sudah implement itu
            bottom: TabBar(
              tabs: tabs,

              // dsini ktia juga bisa atur untuk indikatir atau garisnya
              indicatorColor: Colors.black,
              indicatorWeight: 5,

              // nah jadi kalo mau tau isinya itu apa
              // si parameter ini
              // tinggal ctrl click
              // lalu lihat paramete ini, dia itu apa isinya
              // atau kalo mau di hover juga bisa
              indicatorAnimation: TabIndicatorAnimation.elastic,

              // ini juga bagus kalo misalakn kita pnya banyak tab lalu nanti bisa di scroll
              mouseCursor: MouseCursor.uncontrolled,
              // isScrollable: true,

              // Atau kita bisa custo indicator kita sneidri
              // jadi misalakn si text tabnya itu kaya tenggelam karena warna indicator
              // tapi berati emua indeikator sebelumnya itu tidak akn berfungsi
              // dan dia itu butuh Decoration lihat aja di hover
              // indicator: BoxDecoration(
              //   color: Colors.green,

              //   borderRadius: BorderRadius.all(Radius.circular(5))
              // ),
              // ini jga keren nih


              // jaid ini tuh kalo ga diselect mau gimana styele si textnya
              // tapi gini jadi urutan eksekusinya itu pertma dari style yang ada di text
              // baru yang ada di unselected ini lalu di theme

              // makanya kalo mau di text itu engga ush pake stylejadi stylenya
              // dari sini aja, dan makanya iconnya berubah jadi biru
              // karena di awalnya tidak di beri style
              unselectedLabelStyle: TextStyle(
                color: Colors.blue
              ),
              indicator: BoxDecoration(
                color: Colors.green,

                border: Border(
                  top: BorderSide(
                    color: Colors.black45,
                    width: 5
                  ),
                )
              ),

              // ini juga bagus
              // indicator: UnderlineTabIndicator(
              //   borderSide: BorderSide(width: 4, color: Colors.amber),
              //   insets: EdgeInsets.symmetric(horizontal: 20),
              // ),
            ),
          ),

          // nah kalo mau buat view dari tabnya
          // maka jumlahnya itu wajib sama dnegna si tabnya
          // dan nanti akan otomatis di ketahui perubahannya ektika di ganti tab
          // mak akan ganti juga viewnya sesuai dengna urutannya
          body: TabBarView(children: tabViews),
          
        ),
      ),
    );
  }

  // itu yang tanpa list

  // Widget build(BuildContext context) {
  //   // jadi length ini itu maksudnay dalah kita punya berapa tab
  //   // DefaultTabController myController = DefaultTabController(length: 3, child: child)
  //   // nah karena dia butuh child dan childnya itu adlah si TabBar
  //   // maka langsung aja kita tulis di sna

  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,

  //     // disni lah ktia akna taruh defaultTabController
  //     home: DefaultTabController(
  //       // dan kita perlu child dan jgua lengthnya
  //       // dan dnegna ini, kita ga perlu lagi untuk atur atur heighnya
  //       // di preferen yan di bottm
  //       // karena sudha di atur oleh widget TabBar yang ad adi botton
  //       length: 3,
  //       child: Scaffold(
  //         // mungkin ktia juga bisa taruh di sini untuk controller DefaulttabController
  //         // tapi sayangnya appBar ini butuh preferred, jadi kita naik lagi ke atas yaitu di scaffold
  //         appBar: AppBar(
  //           title: Text('My Apps'),
  //           centerTitle: true,
  //           flexibleSpace: Container(color: Colors.lightBlue),

  //           // jai disini ga usah pake preferen lagi karena tabBar sudah implement itu
  //           bottom: TabBar(
  //             tabs: [
  //               Tab(
  //                 // jadi si Tab ini butuh paling tidak satu antara child, text atau icon

  //                 child: Text(
  //                   'tab satu',
  //                   style: TextStyle(color: Colors.white),
  //                 ),
  //               ),
  //               Tab(
  //                 child: Text('tab dua', style: TextStyle(color: Colors.white)),icon: Icon(Icons.add_a_photo),
  //               ),
  //               Tab(
  //                 child: Text(
  //                   'tab tiga',
  //                   style: TextStyle(color: Colors.white),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         body: Center(),
  //       ),
  //     ),
  //   );
  // }

  // bisa seperti ini, kalo kita ignin resize ukuran heighnya
  // tapi sebernya kita juga bisa seperti yang diatas

  // Widget build(BuildContext context) {

  //   // jadi length ini itu maksudnay dalah kita punya berapa tab
  //   // DefaultTabController myController = DefaultTabController(length: 3, child: child)
  //   // nah karena dia butuh child dan childnya itu adlah si TabBar
  //   // maka langsung aja kita tulis di sna

  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: Scaffold(appBar: AppBar(
  //       title: Text('My Apps'),
  //       centerTitle: true,
  //     flexibleSpace: Container(color: Colors.lightBlue,),
  //       // jadi ketika kita igin membuat tab
  //       // kita perlu bottom
  //       // jad emang biasanya itu di pake untuk tabbar
  //       // bottom: PreferredSize(preferredSize: Size.fromHeight(100), child: Text('data bottom')),

  //       // nah tapi ktia bisa aja langusng gini
  //       // karna widget TabBar ini sudah implements PreferredSize

  //       // nah untuk membuat tab
  //       // ktia itu harus tentukan dulu default tabnya itu mau ayng mana, ad adi atas ya

  //       // nah karena si DefaultTabController ini tidak impemetn si preferred
  //       // aka ktia bungkus aja pake preferred

  //       bottom: PreferredSize(
  //         // llu kita tambahkan juga parameter heightnya
  //         preferredSize: Size.fromHeight(50),
  //         child: DefaultTabController(
  //           length: 3,
  //           child: TabBar(tabs: [
  //             Tab(child: Text('tab satu', style: TextStyle(color: Colors.white),),),
  //             Tab(child: Text('tab dua', style: TextStyle(color: Colors.white),),),
  //             Tab(child: Text('tab tiga', style: TextStyle(color: Colors.white),),),
  //           ]),
  //         ),
  //       ),
  //     ), body: Center()),
  //   );
  // }
}
