import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Contoh Drawer",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  
  // ini biar anti kit aga perlu pake widget Builder di center di bodynya
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // nah lalu disni kita pasang ini ke parameter key di scaffold

  // dan nanti ketika kitamau akses context scaffold
  // kita bis pake scaffoldKey.currentState?.openEndDrawer()


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        // ini untuk drawer kanan
        actions: [
          ElevatedButton(
            onPressed: () {
              // ini untuk buka drawer kanan
              scaffoldKey.currentState?.openEndDrawer();
            },
            child: Icon(Icons.menu),
          ),
        ],
      ),
      // drawerBarrierDismissible: true,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Rafa Khadafi',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'rafaoffice2105@email.com',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            // MENU ITEMS
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // nah jaid ini tuh mirip juga sama dialog, jadi kaya tumpukn giut
                // /jad kalo mau keluar maka bisa juga pake ini
                // Tutup drawer
                Navigator.pop(context);
                // Navigasi ke halaman home
              },
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // nah jaid ini tuh mirip juga sama dialog, jadi kaya tumpukn giut
                // /jad kalo mau keluar maka bisa juga pake ini
                Navigator.pop(context);
                // Navigasi ke settings
              },
            ),

            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                // nah jaid ini tuh mirip juga sama dialog, jadi kaya tumpukn giut
                // /jad kalo mau keluar maka bisa juga pake ini
                Navigator.pop(context);
                // Navigasi ke help
              },
            ),

            // DIVIDER
            Divider(),

            // FOOTER MENU
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                // Logout logic
              },
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.person, size: 40),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Rafa Khadafi',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'rafaoffice2105@email.com',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            // MENU ITEMS
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // nah jaid ini tuh mirip juga sama dialog, jadi kaya tumpukn giut
                // /jad kalo mau keluar maka bisa juga pake ini
                // Tutup drawer
                Navigator.pop(context);
                // Navigasi ke halaman home
              },
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // nah jaid ini tuh mirip juga sama dialog, jadi kaya tumpukn giut
                // /jad kalo mau keluar maka bisa juga pake ini
                Navigator.pop(context);
                // Navigasi ke settings
              },
            ),

            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                // nah jaid ini tuh mirip juga sama dialog, jadi kaya tumpukn giut
                // /jad kalo mau keluar maka bisa juga pake ini
                Navigator.pop(context);
                // Navigasi ke help
              },
            ),

            // DIVIDER
            Divider(),

            // FOOTER MENU
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                // Logout logic
              },
            ),
          ],
        ),
      ),

      // nah gini sbenernya keitka kitamau akses drawer di scaffold
      // kita butuh akses ontext yang berada di bawah si scafoodlnya
      // /nah di myhome
      // /ini tuh mirip kayakasus sebelumnya
      // jadi build yang ada di myhome (yang ada scaffoldnya)
      // ini tuh keburu di buat si contextnya dari pada scaffold
      // harusnya kan kalo au akses scaffold maka contextnya itu harus ada di bawah scaffold

      // makanya kita bisa bunkus dulu si Center / Stack ini dengna Widget Build
      // kaya gini
      //  child: Builder(
      // builder: (context) {
      //   return Stack(


      // atau cara kedua ini yang paling bestpractice itu kita pake global scaffold GlobalKey<ScaffoldState>


      body: Center(
        child: Stack(
          children: [
            Text('ini homepage'),
            Align(
              alignment: Alignment.bottomCenter,
              child: FloatingActionButton(
                onPressed: () {
                  // ini kita bisa buka menu drawer pake programning
                  // ini kita buat buka yang drawer kanan / endDrawer

                  scaffoldKey.currentState?.openEndDrawer();
                },

                child: Icon(Icons.media_bluetooth_off),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
