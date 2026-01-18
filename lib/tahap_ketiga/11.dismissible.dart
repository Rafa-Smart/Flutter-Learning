import 'package:flutter/material.dart';

// ini beberpa permsalahn ketika buat dan maslah expanded
// https://chatgpt.com/c/69690b86-c818-8323-941c-1404e529a62f

// nanti lihat pokoknya beosk itu ai masalh si center

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // disin ga papa kita pakein dia context
    // tapi context untuk halaman pertama itu nanti untuk
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TodoItem> todoLists = List.generate(100, (index) {
    return TodoItem(id: index, text: 'Belajar Flutter ${index}}');
  });

  List<TodoItem> todoDelete = [];
  List<TodoItem> todoCheck = [];
  @override
  Widget build(BuildContext context) {
    // nah gini, misla di materialapp itu dia punya theme
    // kan untuk aksesnya itu kita butuh cntext
    // nah ktia bisa menggunakna context yang ada di widget ini / homePage
    // karena nanti dia akna ada di home kan
    // nah dnegna dia mempunyai context ini dia akn punya akses ke parentnya
    // jadi dia bisa akses si theme milik si APp widget
    // nah karena context kita ayng ad adi homepage ini ada dibawha
    // si material app
    // makanya kita bisa akses si themenya
    // https://gemini.google.com/app/ca84a51a5983ff2c
    // tuh lihat

    // jangan di definisiak disini
    // karena tiap setState itu selalu di buat ualng
    // dan todlists tetep 3 dna todo cheak dan delete tetep 0
    // /makanya pindahin di atas build
    // List<TodoItem> todoLists = [
    //   TodoItem(id: '1', text: 'Belajar Flutter'),
    //   TodoItem(id: '2', text: 'Buat aplikasi TODO'),
    //   TodoItem(id: '3', text: 'Pelajari Dismissible'),
    // ];

    // List<TodoItem> todoDelete = [];
    // List<TodoItem> todoCheck = [];

    return Scaffold(
      appBar: AppBar(title: Text('ini app bar'), centerTitle: true),
      body: Column(
        children: [
          // nah disni itu si row
          // harus kita kasih ukuran
          // /biar nanti sisainya it diambil sama si expanded setelah si row iini
          // kita pake container aja
          Container(
            width: double.infinity,
            height: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // nah yang sla itu disinya
                // jadi si column ga tau ukurnanya itu berapa\\
                // makanya agr bisa saLING DI ISI
                // KITA BUNGKUS DENGAN EXPANDED
                // JADI SETENAH ETANGAH UKURANNYA
                Expanded(
                  child: Column(
                    children: [
                      Center(child: Text("Delete Data")),
                      Expanded(
                        child: ListView.builder(
                          itemCount: todoDelete.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                leading: Icon(Icons.delete),
                                title: Text('${todoDelete[index].text}'),
                                subtitle: Text('sudah di hapus'),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Center(child: Text('Check Datas')),
                      Expanded(
                        child: ListView.builder(
                          itemCount: todoCheck.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                leading: Icon(Icons.check),
                                title: Text('${todoCheck[index].text}'),
                                subtitle: Text('sudah di Check'),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // nah disni itu si expandedn kan aaknya si row
          // nah padahal si rownya iini engg akasih constainr ukuran
          // makanya error
          // /akrean expanded itu harus jelas ukuran si parentnya
          // kan dia akna ngambil data sisanya

          // jadi gimana ambil sisanya kalo engga di tentuin
          Expanded(
            child: ListView.builder(
              itemCount: todoLists.length,
              itemBuilder: (context, index) {
                // https://gemini.google.com/app/20f892fe2db3b6bd?is_sa=1&is_sa=1&android-min-version=301356232&ios-min-version=322.0&campaign_id=bkws&utm_source=sem&utm_medium=paid-media&utm_campaign=bkws&pt=9008&mt=8&ct=p-growth-sem-bkws&gclsrc=aw.ds&gad_source=1&gad_campaignid=20437330464&gbraid=0AAAAApk5Bhka66AdFa8cOMC3Zhidi-TjD&gclid=CjwKCAiAvaLLBhBFEiwAYCNTf84PYs3j_YmOa1IKxfZm98fwQyOIhRtFE-k6uAr3aguZAy8DPbWWpxoCyLUQAvD_BwE
                // Akses Tema & Media Query: Setiap item di dalam list mungkin butuh tahu ukuran layar (MediaQuery) atau warna tema (Theme.of(context)) agar bisa menyesuaikan tampilannya secara individual.
                // Navigasi dari Item: Jika kamu ingin mengklik salah satu item lalu pindah ke halaman detail (Navigator.push), kamu butuh context dari item tersebut untuk memberitahu Flutter dari mana perpindahan itu dimulai.
                return Dismissible(
                  // ini harus juga ya si key ini
                  // fugnsinya biar tau ini tuh data item list yang mana
                  // key: todoLists[index].id,

                  // salnya itu gitu, tapi ga boleh, karena key ini
                  // harus bertipe key bukan string
                  key: ValueKey(todoLists[index].id),

                  // disni itu ada horizontal -> bisa kiri kanan
                  // ada juga StartToEnd berati dari kiri ke kanan
                  // ada juga EndToStart berati dari kanan ke kiri
                  direction: DismissDirection.horizontal,
                  // background ini khusus ketika kamu amu geer dari kiri ke kanan
                  // StartToEnd
                  background: Container(
                    color: Colors.green,
                    // disini tngah kiri ya si containernya
                    // jadi keliatan pas di geser kekaan
                    alignment: AlignmentGeometry.centerLeft,
                    // jadi disni biar nanti ada muncul si continernya ktia kasih padding
                    // tapi di kiri aja
                    // dan sekaligus kita kasih icon
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(Icons.check, color: Colors.white),
                    ),
                  ),

                  dismissThresholds: {
                    // nah jadi untuk ketika kita ingin
                    // geser secara horizontal bisa kiri atau kanan
                    DismissDirection.horizontal: 23,
                  },

                    // INGAT
                    // ini tuh terjadi sebelum si onDismissed terjadi
                    // jadi sebelum di hapus
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.endToStart) {
                      // Untuk delete, tampilkan dialog
                      final isHapus = await _showDialogDelete(context);
                      return isHapus;

                      // nah jaid disini itu
                      // kalo misalkan return false
                      // maka akan di undo otimatis
                      // jadi ui nya akan balik lagi

                      // tapi kalo true maka lanjut aja ke bawahnya
                    }
                    // Untuk check, langsung dismiss
                    return true;
                  },

                  // ini untuk dari kanan ke kiri
                  // EndToStart
                  secondaryBackground: Container(
                    color: Colors.red,
                    // kebalikan aja dari ayng atas
                    alignment: AlignmentGeometry.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                  ),

                  // nah sekarang kita buat katika sedang di geser
                  // dan kita juga bisa atur ya seberapa jauh kita gesernya pake threashold
                  // cari aja

                  // parameter direction ini sudah ad adari sananya ya
                  // jadi kaya calback gitu
                  onDismissed: (direction) async {
                    // disin kan mau kita hapus dari list todo ya
                    // mau itu ceklis atau delete
                    // tapi bukan kita hapus beneran
                    // tapi kita akn removeAt -> kebaliakn item yag di hapus
                    // llau kita push ke list algi masing masing
                    // lalu tampil nanti data yang di hapus atau di ceklis

                    // disini cek dulu direction untuk ceklis
                    // atau delete

                    // disni simpan datnaya

                    final dataRemoved = todoLists[index];

                    if (direction == DismissDirection.startToEnd) {
                      setState(() {
                        // ini kalo di ceklis
                        // removeAt -> kembalakand ata yang di hapus
                        final data = todoLists.removeAt(index);
                        todoCheck.add(data);
                      });
                    }

                    if (direction == DismissDirection.endToStart) {

                      // ini gausah 
                      // KARENA KITA UHA PUNYA YANG NAMANAYA CONFIRMDISMISS
                      // JADI DISANA ITU KTIA BISA CEK
                      // JIKA DI GESER KE KIRI MAKA MUNCUL DIALOG



                      // disni ktia kasih await
                      // berati di fungsi onDismissed kita kasih async
                      
                      // final isHapus = await _showDialogDelete(context);
                      // if (!isHapus) {
                      //   setState(() {
                      //     todoLists.insert(index, dataRemoved);
                      //   });
                      // }
                      setState(() {
                        // removeAt -> kembalakand ata yang di hapus
                        final data = todoLists.removeAt(index);
                        todoDelete.add(data);
                      });
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                        content: Text(
                          direction == DismissDirection.startToEnd
                              ? "Berhasil Di Check"
                              : "Berhasil Di Delete",
                        ),
                        // duration: Duration(seconds: 1),
                        action: SnackBarAction(
                          label: "Batal",
                          onPressed: () {
                            // disni kita setState lagi untuk balikin data
                            setState(() {
                              // todoLists.insert(index, todoLists[index]);
                              // kalo begitu ga akan ada karena
                              // sudah d hapus index yang itu

                              // makanya sebelmnya kita harus tangkap dulu data yang di removenya
                              todoLists.insert(index, dataRemoved);

                              // lalu kita cek dulu apakah ang di hapus itu yang kiri kenkanan atua sebalknya

                              // if (direction == DismissDirection.startToEnd) {
                              //   todoCheck.removeAt(index);
                              // }
                              // if (direction == DismissDirection.endToStart) {
                              //   todoDelete.removeAt(index);
                              // }

                              // gauaah gitu, tapi kita hapus aa di keduanya langusng
                              // todoDelete.removeAt(index);
                              // todoCheck.removeAt(index);

                              // itu juga salah ya
                              // karena index ini milik si todoLists
                              // jadi kita gini aja
                              todoDelete.remove(dataRemoved);
                              todoCheck.remove(dataRemoved);
                            });
                          },
                        ),
                      ),
                    );
                  },

                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.task),
                      title: Text('${todoLists[index].text}'),
                      subtitle: Text('Geser kiri/kanan'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TodoItem {
  final id;
  final text;
  TodoItem({this.id, this.text});
}

// disni kalo bool doang akna error
// karena ini tuh future
// jadi bungkus dulu negna future
Future<bool> _showDialogDelete(BuildContext context) async {
  final result = await showDialog(
    context: context,
    builder: (contextDialog) {
      return AlertDialog(
        title: Text('Hapus'),
        content: Text('apakah anda yakin?'),
        actions: [
          TextButton(
            onPressed: () {
              // nah jaid nanti si result ini akna kembalikan data false
              // atau true, disni jika batal maka akna false
              Navigator.pop(context, false);
            },
            child: Text('batal'),
          ),
          TextButton(
            onPressed: () {
              // disni balikinnya akan menjadi true
              // jadi si result ini hasilnya kana mnejadi true

              // nah jadi anggap aaja kaya dari halaman dialog
              // dia kan di pop nah diitu ngembalikin data ke halaman sekarang
              // jadi akan masuk ke si result
              Navigator.pop(context, true);
            },
            child: Text('hapus', style: TextStyle(color: Colors.green)),
          ),
        ],
      );
    },
  );

  return result;
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const App());
// }

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late List<TodoItem> todoLists=[TodoItem(id: '1', text: 'Belajar Flutter'),
//       TodoItem(id: '2', text: 'Buat aplikasi TODO'),
//       TodoItem(id: '3', text: 'Pelajari Dismissible'),];
//   late List<TodoItem> todoDelete=[];
//   late List<TodoItem> todoCheck=[];

//   @override
//   void initState() {
//     super.initState();
//     todoLists = [
//       TodoItem(id: '1', text: 'Belajar Flutter'),
//       TodoItem(id: '2', text: 'Buat aplikasi TODO'),
//       TodoItem(id: '3', text: 'Pelajari Dismissible'),
//     ];
//     todoDelete = [];
//     todoCheck = [];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TODO App'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // ===== BAGIAN ATAS (DELETE & CHECK) =====
//           SizedBox(
//             height: 120,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     children: [
//                       const Text('Delete Data'),
//                       const Divider(),
//                       Expanded(
//                         child: ListView.builder(
//                           itemCount: todoDelete.length,
//                           itemBuilder: (context, index) {
//                             return ListTile(
//                               leading: const Icon(Icons.delete),
//                               title: Text(todoDelete[index].text),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     children: [
//                       const Text('Check Data'),
//                       const Divider(),
//                       Expanded(
//                         child: ListView.builder(
//                           itemCount: todoCheck.length,
//                           itemBuilder: (context, index) {
//                             return ListTile(
//                               leading: const Icon(Icons.check),
//                               title: Text(todoCheck[index].text),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const Divider(height: 1),

//           // ===== LIST UTAMA =====
//           Expanded(
//             child: ListView.builder(
//               itemCount: todoLists.length,
//               itemBuilder: (context, index) {
//                 final item = todoLists[index];

//                 return Dismissible(
//                   key: ValueKey(item.id),
//                   direction: DismissDirection.horizontal,
//                   background: Container(
//                     color: Colors.green,
//                     alignment: Alignment.centerLeft,
//                     padding: const EdgeInsets.only(left: 20),
//                     child: const Icon(Icons.check, color: Colors.white),
//                   ),
//                   secondaryBackground: Container(
//                     color: Colors.red,
//                     alignment: Alignment.centerRight,
//                     padding: const EdgeInsets.only(right: 20),
//                     child: const Icon(Icons.delete, color: Colors.white),
//                   ),
//                   onDismissed: (direction) {
//                     setState(() {
//                       final removed = todoLists.removeAt(index);
//                       if (direction == DismissDirection.startToEnd) {
//                         todoCheck.add(removed);
//                       } else {
//                         todoDelete.add(removed);
//                       }
//                     });
//                   },
//                   child: Card(
//                     child: ListTile(
//                       leading: const Icon(Icons.task),
//                       title: Text(item.text),
//                       subtitle: const Text('Geser kiri / kanan'),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TodoItem {
//   final String id;
//   final String text;

//   TodoItem({required this.id, required this.text});
// }
