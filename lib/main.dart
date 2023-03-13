import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esantren_v1/Screens/Absensi1_PilihKelas.dart';
import 'package:esantren_v1/Screens/Absensi2_Absensi.dart';
import 'package:esantren_v1/Screens/BayarSpp1_MainScreen.dart';
import 'package:esantren_v1/Screens/Kesehatan1_ MainScreen.dart';
import 'package:esantren_v1/Screens/SantriBaru.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './Screens/HomePage.dart';
import './Screens/LoginPage.dart';
import 'package:esantren_v1/widget_tree.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // name: 'e-santren',
      options: FirebaseOptions(
          apiKey: "AIzaSyBrdjIPSIhnQjZuiQ1DsRNFUngs0vXIF_4",
          appId: "1:385003370337:web:44c6fad4e10def2bd47720",
          messagingSenderId: "385003370337",
          projectId: "e-santren"));
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
      initialRoute: WidgetTree.id,
      locale: Locale('id'),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        WidgetTree.id: (context) => WidgetTree(),
        SantiBaru_MainPage.id: (context) => SantiBaru_MainPage(),
        // HomePage.id: (context) => HomePage(user),
        Absensi1_PilihKelas.id: (context) => const Absensi1_PilihKelas(),
        Absensi2_Absensi.id: (context) => Absensi2_Absensi(),
        Kesehatan1_MainScreen.id: (context) => Kesehatan1_MainScreen(),
        BayarSpp1_MainScreen.id: (context) => BayarSpp1_MainScreen()
      },
    );
  }
}
