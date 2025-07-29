import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Contoh Card Flutter')),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildCard(),
              SizedBox(height: 20,),
              buildCard(),
              SizedBox(height: 20,),
              buildCard(),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}

class buildCard extends StatelessWidget {
  const buildCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.person, size: 40, color: Colors.blue),
            SizedBox(height: 10),
            Text('Nama: Rafa Khadafi', style: TextStyle(fontSize: 18)),
            Text('Flutter Developer', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
