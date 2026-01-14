import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: App()));
  }
}

class App extends StatefulWidget {
  @override
  _App createState() => _App();
}

class _App extends State<App> {
  List<String> datas = List.generate(20, (index) => "${index}");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Data utama ke ${index}'),
          subtitle: Text('subtitle loremasdsadasdasdasdsadsadsadasdasdsadsad ${index}', style: TextStyle(
            
          ),),
          leading: CircleAvatar(child: Icon(Icons.person_2)),

          // ini tuh nanti untuk di sebelah kanan
          // biasanya untuk mennujuakn waktu seperti di chat wa, tapi ini
          // mah di kanan terus di tengah nya
          trailing: Text('10:00 pm'),

          // ini juga bisa di baut agar nanti jadi lebih padat antar komponennya
          dense: false,
        );
      },
    );
  }
}
