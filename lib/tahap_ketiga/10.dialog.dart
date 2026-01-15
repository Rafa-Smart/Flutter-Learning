import 'package:flutter/material.dart';

// https://chat.deepseek.com/a/chat/s/65f705c0-b423-4be1-9562-1243a072c7a6

// nah kalo ada builder itu kita berati membuat context ya

void main() {
  // runApp(App());

  // harusnya gini karena kita but dulu materialappnya
  // baru kita buat contextny di widget yang di bawah dari si materialApp ini

  // dan ini tuh best practicenya karena suahd defualtnya gini
  // tpi yang leihbagus itu kita buat dulu widget / class yang return material app saja
  // kemudian haru kita buat lagi class baru misal homepage yang meretunkna scaffold dengan context
  // jadi di paramter home di material kita masukan widget homepage

  runApp(MaterialApp(home: App()));
}

// ini penjelasnanya
// https://chatgpt.com/c/6968d840-6bfc-8321-91d7-b2f811af938f
// nah gini
// ketika kita buat context untuk dialog di dalam method build yang mencakup
// material app
// nah nanti contextnya itu akan dibuat dulu sebelum materialAppnya di buat
// harusnya kan kalo context itu harus di bawha materialApp

// tapi karena contextnya ini sudah keburu di buat
// jadinya gini pas kita ketik runApp(App());
// diakan return build nah di build ini dia sudah ada context
// dan barulah dia return material App

// /jadi nanti contextnya ada di app
// sedangkanketika kita igin aksesnmisal context: context pada
// parameter widget, dia itu akna mencari context secara ke atas tapi yang di bawah materiapapp
// dan karena si contextnya ini ada di app yang tidak di bawah material app
// maka akn error

// harusnya kan buat dulu material app, baru kita baut contextnya

// jadinya kita harusnya di pisah dulu di main.dart untuk amterialapp
// tapi ga papa di runApp kita masuakn saja materialapp
// nah disana kita hanya jalankan materilapp baru nanti di homenya kita
// reutnr widgt yang ada showDialognya

// jadi contextnya itu di buat setelah amterial app di buat

// maka nanti

class App extends StatelessWidget {
  @override
  // jadi gini kalo ktia pake method build
  // /maka berati kita harus buat context baru
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // nah disni ktia akn show dialog
                  showDialog(
                    context: context, // ini context dari App di fungsi build
                    builder: (contextDialog) {
                      // ini context dari si dialog
                      // jadi nanti ka pas kita tampilkan dialog ini itu akna seperti tumpukan
                      // atau seperti pindah halaman
                      // jadi karena kita butuh navogator
                      // maka ktia butuh context

                      // jadi pas dia tampilkan si dialog itu mirip seperti
                      // kita push contextDialog (baru) menggunakna navigator
                      // diatas context yang context lama
                      // atau si App -> kalo disini mah

                      return AlertDialog(
                        title: Text("peringatan nih"),
                        content: Text("apakah anda yakin ?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // ini ketika klik batal
                              // jadi dia pop kan lagi si navbarnya

                              Navigator.pop(
                                // disin ktia masukan context yang mau di pop
                                // ingat gaboleh pake context yang si App
                                // nanti yang hilang / ke pop
                                // malah si App
                                contextDialog,
                              );
                            },
                            child: Text("batal"),
                          ),

                          TextButton(
                            onPressed: () {
                              // ini ketika klik batal
                              // jadi dia pop kan lagi si navbarnya
                              print('user memilih iya');
                              Navigator.pop(
                                // disin ktia masukan context yang mau di pop
                                // ingat gaboleh pake context yang si App
                                // nanti yang hilang / ke pop
                                // malah si App
                                contextDialog,
                              );
                            },
                            child: Text("simpan"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Button Dialog!'),
              ),

              // ini dialog form
              SizedBox(height: 10),
              ElevatedButton(onPressed: (){

                // lihat parameter context yang dari sini akna di teruskan ke
                // void _showInputDialog(BuildContext context) async {
                // makanya sekarnag contex yang ad adi situ ada lah cntext si App yang sudah punya context di bawah materiapApp
                
                _showInputDialog(context);
              }, child: Text('dialog with input'))
            ],
          ),
        ),
      );

  }
}

// disini ktia kasih dulu contextnya
// jaid ini tuh context yang ada di root ya
// jadi kita terusin ke sini
// karena pareameeternya itu Build (mungkin) tanya aja nanti
void _showInputDialog(BuildContext context) async {
  String inputText = '';
  final result = await showDialog(
    context: context, // ini context yang di alirin dari atas ya
    builder: (_showInputDialogContext){
      return AlertDialog(
        title: Text('masukan nama'),
        content: TextField(
          onChanged: (dataInputan) {
            inputText = dataInputan;
          },
          decoration: InputDecoration(hintText: "ketik nama anda..."),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(_showInputDialogContext, inputText);
            // nah ingat ya kalo inputText ini sekarang masuk di result
          }, child: Text('Simpan'))
        ],
      );
    },
  );

  if(result != null){
    print('nama yang di masukan ${result}');
    // context disini itu dari BuildContext yang dari App ya
    // yang dari atas
    // karena dia diterusin ke widget ini
    // di terusin akrena nantinya widget ini akna kita simpan di dalam
    // Widget App yang sudha punya context yang di bawah materialApp

    // jadi dia akna menampilkan message ini didalm halaman yang punya context

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Halo ${result}')));
  }

}


// ini penjelasan ayng benar
// PNETING
// https://gemini.google.com/app/889ddff1dca4177a
// apakah maksudnya adalh kan ada dua halaman, yaitu a pelimilik context dan dialog pemilik dialogContext, nah ketika dia ada di overlay si dialogContext pas dia pop apakah nilai dari paremater kedua pada fungsi pop akan di return ke halaman a ?

// ini penjelasan benernya dari ai
// Ketika kita memanggil runApp(App()), Flutter akan membuat widget App terlebih dahulu, lalu memanggil method build() milik App.
// Pada saat build() dipanggil, BuildContext untuk App sudah dibuat, tetapi MaterialApp belum dibangun karena MaterialApp adalah hasil dari build() itu sendiri.

// Akibatnya, context yang berada di dalam App.build() belum berada di bawah MaterialApp dalam widget tree.
// Ketika context tersebut digunakan untuk memanggil showDialog, Flutter akan mencari MaterialLocalizations dan Navigator ke arah atas widget tree, tetapi tidak menemukannya karena MaterialApp belum ada di atas App.

// Oleh karena itu, solusi yang benar adalah memposisikan MaterialApp sebagai root widget (misalnya langsung di runApp), lalu memanggil showDialog dari widget child yang berada di bawah MaterialApp. Dengan demikian, BuildContext yang digunakan sudah berada di dalam scope MaterialApp.