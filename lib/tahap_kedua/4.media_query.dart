// jadi segala sesuatu yang ada pada device pengguna, maka akna disalurkan ke
// class MediaQuery.of(context)

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// nah ini lebih baikk,
// karena kita menggunakan contxt parentnya bukan lnagusng dari si leba dan tinggi dari layar
// kalo mau pake lebar dan tinggi dari layar, maka harus mneggunakan MediaQuery.of(context).size.width

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //INI DIPINDAH KE DALAM MaterialApp SUPAYA context VALID
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ini appbar'),
          elevation: 5,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              image: DecorationImage(
                image: AssetImage("assets/images/corak.jpg"),
                fit: BoxFit.none,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          leading: Icon(
            Icons.access_time_rounded,
            size: 50,
            color: Colors.blue,
          ),
          actions: [Icon(Icons.accessibility_new_rounded, size: 50)],
          toolbarHeight: 100,
        ),
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // context ini berasal dari si lebar layar
              final containerWidth = constraints.maxWidth / 1.5;
              final containerHeight = constraints.maxWidth / 1.2;

              return Container(
                width: containerWidth,
                height: containerHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purpleAccent, Colors.blueAccent],
                  ),
                ),
                child: LayoutBuilder(
                  // context ini berasal dari si container pembungkus
                  builder: (context, innerConstraints) {
                    final innerWidth = innerConstraints.maxWidth;
                    final innerHeight = innerConstraints.maxHeight;

                    return (MediaQuery.of(context).orientation ==
                            Orientation.portrait)
                        ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: buatContainer(innerWidth, innerHeight),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: buatContainer(
                              innerWidth,
                              innerHeight,
                              isRow: true,
                            ),
                          );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  List<Widget> buatContainer(
    double innerWidth,
    double innerHeight, {
    bool isRow = false,
  }) {
    List<Color> warna = [Colors.red, Colors.blue, Colors.green];
    List<double> lebar = [1 / 4, 1 / 3, 1 / 2];

    return List.generate(3, (i) {
      final kontainer = Container(
        width: isRow ? null : innerWidth * lebar[i],
        height: innerHeight / 4,
        color: warna[i],
      );

      return isRow
          ? Expanded(flex: (lebar[i] * 100).toInt(), child: kontainer)
          : kontainer;
    });
  }
}
// bisa juga gitu, tpai ini lebih baik

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // ini adalah lebar layar saat ini
//     // jadi uutk mendapatkan contextnya, kita harus berada didalam context tersebut
//     final lebarLayar = MediaQuery.of(context).size.width;
//     final tinggiLayar = MediaQuery.of(context).size.height;

//     // untuk mendapatkan orientasinya
//     final orientasi = MediaQuery.of(context).orientation;
//     print('ini orientasi: $orientasi');
//     // ini orientasi: Orientation.landscape

//     print(' lebar layarnya: $lebarLayar');
//     // lebar layarnya: 678
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('ini appbar'),
//           elevation: 5,
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.red, Colors.blue],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               image: DecorationImage(
//                 image: AssetImage("/assets/images/corak.jpg"),
//                 fit: BoxFit.none,
//                 repeat: ImageRepeat.repeat,
//               ),
//             ),
//           ),
//           leading: Icon(
//             Icons.access_time_rounded,
//             size: 50,
//             color: Colors.blue,
//           ),
//           actions: [Icon(Icons.accessibility_new_rounded, size: 50)],
//           toolbarHeight: 100,
//         ),
//         body: Center(
//           child: Container(
//             // disini ktia buat agar container ini ukurannya
//             // adalah sepertiga dari layar
//             width: lebarLayar / 3,
//             height: lebarLayar / 2,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.purpleAccent, Colors.blueAccent],
//               ),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width / 4,
//                   height: MediaQuery.of(context).size.height / 4,
//                   color: Colors.red,
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width / 4,
//                   height: MediaQuery.of(context).size.height / 4,
//                   color: Colors.blue,
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width / 4,
//                   height: MediaQuery.of(context).size.height / 4,
//                   color: Colors.green,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
