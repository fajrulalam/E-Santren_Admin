import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esantren_v1/Classes/CurrentUserClass.dart';
import 'package:esantren_v1/Objects/CurrentUserObject.dart';
import 'package:esantren_v1/Screens/Absensi1_PilihKelas.dart';
import 'package:esantren_v1/Screens/SantriBaru.dart';
import 'package:esantren_v1/Screens/BayarSpp1_MainScreen.dart';
import 'package:esantren_v1/Screens/Kesehatan1_%20MainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:esantren_v1/CustomWidgets/MainMenuButtons.dart';

import '../Classes/Authentication.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CurrentUserObject _userObject = CurrentUserObject();

  int _selectedIndex = 0;

  final User? user = Auth().currentUser;

  FirebaseFirestore db = FirebaseFirestore.instance;
  late String username;
  Widget body = Container();

  void getUserDetail() async {
    _userObject = await CurrentUserClass().getUserDetail();
    setState(() {
      body = MainStatelessWidget(_userObject.namaPanggilan);
      print('This code was run ${_userObject.namaPanggilan}');
    });
  }

  @override
  void initState() {
    super.initState();
    getUserDetail();

    //
    // db.collection("PengurusCollection").doc(user?.uid).get().then((value) {
    //   setState(() {
    //     String namaLengkap = value.get("namaLengkap").toString();
    //     String namaPanggilan = value.get("namaPanggilan").toString();
    //     String jenisKelamin = value.get("jenisKelamin").toString();
    //     String kotaAsal = value.get("kotaAsal").toString();
    //     String tglLahir = value.get("tglLahir").toString();
    //     String mukim_str = value.get("mukim").toString();
    //     bool mukim = mukim_str == 'true';
    //     List<dynamic> mengajarKelas = value.get("mengajarKelas");
    //     _userObject = CurrentUserObject(
    //         namaLengkap: namaLengkap,
    //         namaPanggilan: namaPanggilan,
    //         jenisKelamin: jenisKelamin,
    //         kotaAsal: kotaAsal,
    //         tglLahir: tglLahir,
    //         mukim: mukim,
    //         mengajarKelas: mengajarKelas);
    //     print('Berhasil mendapatkan $namaPanggilan');
    //     body = MainStatelessWidget(namaPanggilan);
    //   });
    // });
  }

  Color gradient2 = Color(0xFF80F1D8);
  Color gradient1 = Color(0xFF65EC65);

  @override
  Widget build(BuildContext context) {
    // final docRef =

    return Scaffold(
      appBar: AppBar(
        title: Text("eSantren"),
      ),
      body: Center(
          child: Container(
        child: body,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3))
            ]),
        constraints: BoxConstraints(maxWidth: 800, maxHeight: 800),
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: "Aktivitas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Pengaturan Akun",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 2,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            switch (index) {
              case 0:
                body = MainStatelessWidget(_userObject.namaPanggilan);
                break;
              case 1:
                //belum ada tampilan
                break;
              case 2:
                body = AccountSettings(context, _userObject);
            }
          });
        },
      ),
    );
  }
}

class MainStatelessWidget extends StatelessWidget {
  String? username;

  MainStatelessWidget(this.username);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 80,
          padding: EdgeInsets.all(20),
          child: Stack(
            children: [
              Container(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(TextSpan(
                    text: "Assalamu'alaikum, ",
                    children: [
                      TextSpan(
                          text: "$username!",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                    style: GoogleFonts.workSans(
                        fontSize: 24, fontWeight: FontWeight.w400))),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            color: Colors.grey[100],
            elevation: 2,
            margin: EdgeInsets.all(20),
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.all(20),
                            child: Text(
                              'Berfikir cepat, Berdzikir kuat, \nBertindak tepat.',
                              style: GoogleFonts.raleway(
                                  height: 1.5,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 0, top: 8),
                            child: Text(
                              "KH. As'ad Umar",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                  height: 1.5, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/hello_santri.png'),
                            alignment: Alignment.bottomRight)),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MainMenuButtons(
                          'Absensi', 'absensi', Absensi1_PilihKelas.id),
                      MainMenuButtons('Mengaji', 'ngaji', '/'),
                      MainMenuButtons(
                          'Bayar SPP', 'bayar-spp', BayarSpp1_MainScreen.id),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MainMenuButtons('Pulang', 'izin-pulang', '/'),
                      MainMenuButtons('Kesehatan', 'data-kesehatan',
                          Kesehatan1_MainScreen.id),
                      MainMenuButtons(
                          'Santri Baru', 'santri-baru', SantiBaru_MainPage.id),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(),
                  flex: 1,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AccountSettings extends StatelessWidget {
  BuildContext context;
  CurrentUserObject currentUserObject;

  AccountSettings(this.context, this.currentUserObject);

  Future<void> _signOut() async {
    try {
      await Auth().signOut();
      // SignOut successful, navigate to the home screen
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print(currentUserObject.namaPanggilan);
    print(currentUserObject.kotaAsal);
    print(currentUserObject.mengajarKelas.toString());
    print(currentUserObject.namaLengkap);
    print(currentUserObject.namaPanggilan);
    print(currentUserObject.namaPanggilan);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
              onPressed: () {
                _signOut();
              },
              child: Text('Sign-Out'))
        ],
      ),
    );
  }
}
