import 'package:flutter/material.dart';

void main (){
  runApp(App());
}

// bisa juga gini jadi ada fitur di sini itu
// jadi kaya periantah tapi komen misa ignore : must_is_imutabble

class App extends StatelessWidget {
  App({super.key});
  final List<Map<String, dynamic>> datas = [
    {
      "name" : "Rafa 1",
      "age":17,
      "hobby": [
        'game',
        'test',
        'plis'
      ]
    },
    {
      "name" : "Rafa 2",
      "age":40,
      "hobby": [
        'game',
        'test',
        'plis'
      ]
    },
  ];


  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          // entries ini akna mengembalikan data = [key, value]
            children: datas.map((data){
              return Card(child: Column(
                children: [
                  Row(children: [
                    CircleAvatar(),
                    Column(
                      children: [
                        // ga bisa karena disini keynya itu harus string
                        // Text("nama: ${data.name}")

                        // jadi harus gini
                        Text('name: ${data['name']}'),
                        Text('age: ${data['age']}'),
                      ],
                    )
                  ],),
                  Row(
                    children: [
                      data['hobby'].map((hobby){
                        return Container(
                          child: Row(
                            children: [
                              Icon(Icons.person),
                              Text(hobby)
                            ],
                          ),
                        );
                      }).toList()
                    ],
                  )


                ],
              ),);
            }).toList(),
        ),
      ),
    );
  }
}