import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {

  // ini agr tidka bisa portrait
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
     runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), 
      debugShowCheckedModeBanner: false, // ini agar debugnya hilang
      );
  }
}

class HomePage extends StatelessWidget {
  double getSmallDiameter(BuildContext context) {
    // jadi kita butuh contextnya, agar bisa mengatur mediaquerynya
    // jadi agar ukurannya itu sesuai dengan ukuran layarnya
    return MediaQuery.of(context).size.width * 2 / 3;
    // jadi ukurannya itu akan dua per tiga dari layarnya
  }

  double getBigDiameter(BuildContext context) {
    return MediaQuery.of(context).size.width * 7 / 8;
  }

  // nah, kenaa kita pake build contest, karena kita ana memanggil fungsi ini
  // didalam sebauh widget yang memiliki context, jadi nanti kita masukan paramnya
  // sesuai dengan contextnya, jadi kita akan mendapatkan context dari widget saat ini

  @override
  build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  const Color.fromARGB(255, 54, 63, 244),
                  const Color.fromARGB(255, 199, 48, 197),
                ],
              ),
            ),
          ),
          Positioned(
            // jadi dia itu akan absolute
            right:
                -getSmallDiameter(context) / 3, // jadi mundur kekanan se per 3
            top:
                -getSmallDiameter(context) / 2, // jadi mundur dari top se per 3
            child: Container(
              width: getSmallDiameter(context),
              height: getBigDiameter(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFB226B2), Color(0xFFFF6DA7)],
                ),
              ),
            ),
          ),
          Positioned(
            // jadi dia itu akan absolute
            left: -getBigDiameter(context) / 4, // jadi mundur kekiri se per 3
            top:
                -getBigDiameter(context) / 4.8, // jadi mundur dari top se per 5
            child: Container(
              child: Center(
                // wajib nih, karena asalnya itu textnya ada di kiri atas
                // jadi kealangan
                child: Text(
                  "Dribblee",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              width: getBigDiameter(context),
              height: getBigDiameter(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xFFB226B2), Color(0xFFFF4891)],
                ),
              ),
            ),
          ),
          Positioned(
            // jadi dia itu akan absolute
            right:
                -getSmallDiameter(context) / 3, // jadi mundur kekanan se per 3
            bottom:
                -getSmallDiameter(context) / 2, // jadi mundur dari top se per 3
            child: Opacity(
              opacity: 0.2,
              child: Container(
                width: getSmallDiameter(context),
                height: getBigDiameter(context),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFB226B2), Color(0xFFFF6DA7)],
                  ),
                ),
              ),
            ),
          ),
          Align(
            // jadi ini tuh fungsinya agar si listviewnya
            // bisa ada nempel di bawah tengah
            alignment: Alignment.bottomCenter,
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 2),

                    borderRadius: BorderRadius.circular(5),
                  ),
                  margin: EdgeInsets.fromLTRB(
                    20,
                    300,
                    30,
                    10,
                  ), // nah ini yg buat dia nempel
                  // ke bawah
                  padding: EdgeInsets.fromLTRB(10, 25, 10, 25),
                  child: Column(
                    children: [
                      MyTextField(
                        namaParam: "UserName: ",
                        iconParam: Icons.person,
                        colorParam: Colors.black,
                        paramIsPassword: false,
                      ),
                      SizedBox(height: 5),
                      MyTextField(
                        namaParam: "Email: ",
                        iconParam: Icons.vpn_key,
                        colorParam: const Color.fromARGB(184, 156, 118, 4),
                        paramIsPassword: true,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 30, 20),
                    child: Text(
                      "FORGOT PASSWORD",
                      style: TextStyle(color: Color(0xFFFF4891), fontSize: 11),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 40,
                        child: Container(
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors
                                .transparent, // ini wajib, agar tidak menghalangi
                            // si containernya
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              splashColor: Colors.amber,
                              onTap: () {},
                              child: Center(
                                child: Text(
                                  "SIGN IN",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFB226B2), Color(0xFFFF4891)],
                            ),
                          ),
                        ),
                      ),

                      // ada 2 cara, sialhkan pilih aja
                      FloatingActionButton(
                        elevation: 0,
                        mini: true,
                        onPressed: () {},
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/images/icon-1.png",
                          ),
                          radius: 20, // ukuran radius gambar
                          backgroundColor: Colors
                              .transparent, // hilangkan warna latar default
                        ),
                      ),

                      FloatingActionButton(
                        elevation: 0,
                        mini: true,
                        onPressed: () {},
                        child: ClipOval(
                          child: Image.asset(
                            "assets/images/icon-1.png",
                            width: 40, // atur ukuran gambar
                            height: 40,
                            fit: BoxFit
                                .cover, // biar gambar pas tanpa ketarik aneh
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "DON'T HAVE AN ACCOUNT?  ",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFFFF4891),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final bool isPassword;
  final String nama;
  final IconData icon;
  final Color Mycolor;
  MyTextField({
    required namaParam,
    required iconParam,
    required colorParam,
    required paramIsPassword,
  }) : nama = namaParam,
       icon = iconParam,
       Mycolor = colorParam,
       isPassword = paramIsPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: nama.toString(),
        labelStyle: TextStyle(color: Color(0xFFFF4891)),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFF4891)),
        ),
        prefixIcon: Icon(this.icon, color: this.Mycolor),
      ),
    );
  }
}
