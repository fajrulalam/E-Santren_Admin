import 'package:esantren_v1/Screens/Absensi1_PilihKelas.dart';
import 'package:esantren_v1/Screens/Absensi2_Absensi.dart';
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
        '/absensi2': (context) => const Absensi2_Absensi()
      },
    );
  }
}
