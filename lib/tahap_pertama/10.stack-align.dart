import 'package:flutter/material.dart';

void main() {
  runApp(StackAlignExample());
}

// nah jadi biasanya kan kalo misakan kita mau ada objek diatas objek itu akn
// bisanya didalam widget msial container, itu kita masukan lagi widget lain

// tapi bisa juga secara berurutan aau sibling pas buatnya, tapi tetep tumpukan
// caranya itu pake stack

// jaid ktia akn buat stack dan align widget

class StackAlignExample extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:Text('ini adalah stack align')),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.green],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Stack(
              children: [
                // disini kita bisa pake align unutk aturnya
                Align( // lapisan pertama
                  alignment: Alignment.center,
                  child: Icon(Icons.access_alarm, size: 60, color: Colors.orange),
                ),
                Align( // lapisan kedua
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("⭐ Favorite", style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                Align( // lapisan ketiga
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Ini adalah Stack + Align", style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
              ],
            ),
          )
        )
      )
    );
  }
}





// class StackAlignExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("Stack + Align")),
//         body: Center(
//           child: Stack(
//             children: [
//               // Latar belakang
//               Container(
//                 color: Colors.blue[100],
//               ),
//               // Icon di tengah
//               Align(
//                 alignment: Alignment.center,
//                 child: Icon(Icons.star, size: 60, color: Colors.orange),
//               ),
//               // Teks di kanan bawah
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text("⭐ Favorite"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
