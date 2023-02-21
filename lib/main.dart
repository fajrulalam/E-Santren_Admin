import 'package:esantren_v1/Screens/Absensi1_PilihKelas.dart';
import 'package:esantren_v1/Screens/Absensi2_Absensi.dart';
import 'package:esantren_v1/Screens/BayarSpp1_MainScreen.dart';
import 'package:esantren_v1/Screens/Kesehatan1_ MainScreen.dart';
import 'package:flutter/material.dart';
import './Screens/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          colorScheme:
              ThemeData().colorScheme.copyWith(primary: Colors.black87),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 1,
              titleTextStyle: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w500,
                  fontSize: 18))),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/absensi': (context) => const Absensi1_PilihKelas(),
        '/absensi2': (context) => Absensi2_Absensi(),
        '/kesehatan1': (context) => Kesehatan1_MainScreen(),
        '/bayar-spp': (context) => BayarSpp1_MainScreen()
      },
    );
  }
}
