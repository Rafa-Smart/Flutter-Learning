import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return MaterialPageRoute(
              builder: (_) => MyHomePage(),
              settings: RouteSettings(name: "/"),
            );
          case "/halaman-1":
            return MaterialPageRoute(
              builder: (_) => Halaman1(),
              settings: RouteSettings(name: "/halaman-1"),
            );
          case "/halaman-2":
            return MaterialPageRoute(
              builder: (_) => Halaman2(),
              settings: RouteSettings(name: "/halaman-2"),
            );
          case "/halaman-3":
            return MaterialPageRoute(
              builder: (_) => Halaman3(),
              settings: RouteSettings(name: "/halaman-3"),
            );
          default:
            return null;
        }
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ini adalah halaman utama')),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/halaman-1");
              },
              child: Text('halaman 1'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/halaman-2");
              },
              child: Text('halaman 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/halaman-3");
              },
              child: Text('halaman 3'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class Halaman1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ini adalah halaman 1')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Kembali ke halaman utama'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/halaman-2");
            },
            child: Text('Ke halaman 2'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/halaman-3");
            },
            child: Text('Ke halaman 3'),
          ),
        ],
      ),
    );
  }
}

class Halaman2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ini adalah halaman 2')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName("/"));
            },
            child: Text('Kembali ke halaman utama'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Kembali ke halaman 1'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/halaman-3");
            },
            child: Text('Ke halaman 3'),
          ),
        ],
      ),
    );
  }
}

class Halaman3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ini adalah halaman 3')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName("/"));
            },
            child: Text('Kembali ke halaman utama'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName("/halaman-1"));
            },
            child: Text('Kembali ke halaman 1'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Kembali ke halaman 2'),
          ),
        ],
      ),
    );
  }
}
