import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:esantren_v1/CustomWidgets/PilihanKelasButton.dart';

class Absensi1_PilihKelas extends StatefulWidget {
  const Absensi1_PilihKelas({Key? key}) : super(key: key);
  static const String id = 'absensi';

  @override
  State<Absensi1_PilihKelas> createState() => _Absensi1_PilihKelasState();
}

class _Absensi1_PilihKelasState extends State<Absensi1_PilihKelas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Kelas"),
        leading: BackButton(
          color: Colors.grey,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'SMA',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black54),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PilihanKelasButton('X'),
                PilihanKelasButton('XI'),
                PilihanKelasButton('XII'),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'SMP',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black54),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PilihanKelasButton('VII'),
                PilihanKelasButton('VII'),
                PilihanKelasButton('IX'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
