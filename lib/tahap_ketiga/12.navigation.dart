import 'package:flutter/material.dart';

// ini penjelannya lengkap banget (navigation)
// https://chat.deepseek.com/a/chat/s/81322432-3a03-475d-9470-3808b990d1cf

// ini routes
// https://chat.deepseek.com/a/chat/s/5fb8abb4-e1a0-4f78-813c-7566491926c9

void main() => runApp(NavigationApp());

class NavigationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contoh Navigasi Lengkap',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: HomeScreen(),
      initialRoute: '/homeScreen',
      routes: {
        '/test2': (context) => Test2(),
        '/homeScreen': (context) => HomeScreen(),
        '/detail': (context) => DetailScreen(),
        '/settings': (context) => SettingsScreen(),
      },
      onGenerateRoute: (settings) {
        // nah ini tuh kirim yang tanpa constructor
        // bisa juga misal dari navigator pushNamed yang ngasih arguments
        // nah kita bis amil dulu
        // disni baru kita masukan kedalam constructronya si widget
        if (settings.name == '/test1') {
          // jdi ini di parsing
          final arguments = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) {
              return Test1(nama: arguments['nama'], umur: arguments['umur']);
            },
          );
        }

        // ini kalo enga pake nanti warnig
        return null;
      },
      // Fallback untuk route yang tidak terdaftar

      //  bisa juga kaya gini
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (context) => NotFoundPage(),
      //   );
      // },
      // Handle route yang tidak dikenal
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => ErrorPage());
      },
    );
  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'halaman error',
          style: TextStyle(fontSize: 30, color: Colors.red),
        ),
      ),
    );
  }
}

class Test1 extends StatelessWidget {
  final nama;
  final umur;
  Test1({required this.nama, required this.umur});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text('nama: ${nama}'),
                  Text('umur ${umur}'),
                ],
              ),
            ),
            Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.back_hand_sharp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Test2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // nah kalo misakan tipe datnaya aja itu engga bisa
    // makanya paling itu kita bisa mmebuat aliasnya aja jadi pake as
    // dan kalo engga bisa maka disini iu ktia pake ??
    final Map<String, dynamic> dataArguments =
        (ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?) ??
        {};
    print(dataArguments);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('nama: ${dataArguments['nama']}'),
            Text('umur: ${dataArguments['umur']}'),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ini kita mau ngirim data
            // tapi engga pake route di onGenerateRoute
            // tapi kita ambil langsung dari si widgetnya pake ModalRoute
            // dan ini tuh ga pake constructor lagi kirim datanya
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/test2',
                  arguments: {'umur': 'Rafa', 'nama': '24'},
                );
              },
              child: Text('kirim data 2'),
            ),
            SizedBox(height: 10,),

            ElevatedButton(
              onPressed: () {
                // nah kalo gini nanti itu engga ada pop otomatis gitu ya
                // ga sama kaya yang push

                Navigator.pushNamed(
                  context,
                  '/test1',
                  arguments: {'umur': '23', 'nama': 'Jamal'},
                );
              },
              child: Text('kirim data'),
            ),
            SizedBox(height: 20),
            // ini yang test diatas
            ElevatedButton(
              onPressed: () {
                // Navigasi dengan data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(message: 'Halo dari Home!'),
                  ),
                );
              },
              child: Text('Pergi ke Detail'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Navigasi dan tunggu hasil
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InputScreen()),
                );

                if (result != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Anda memasukkan: $result'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              child: Text('Input Data'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: Text('Pengaturan (Named Route)'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String message;

  DetailScreen({this.message = 'Default Message'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pesan: $message'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

class InputScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Screen')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(labelText: 'Masukkan teks'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // nah dari sini uth
                // kita kan di fungsi onPress atau di navigator ini tifak
                // menampung data seperti di dialog

                // nah ini tuh datanya akna ada di dalam halaman
                // yang memanggil Navigator.push ke halaman ini

                // /makanya di halaman terebut kita harus simpan
                // ke dama variablle (dihaalaman yang manggil ini)

                // nah nanti datayang kita kirim dari sini akna masuk ke sana
                Navigator.pop(context, controller.text);
              },
              child: Text('Simpan & Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Kembali ke Home'),
        ),
      ),
    );
  }
}
