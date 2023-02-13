import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PilihanKelasButton extends StatelessWidget {
  String kelas;

  PilihanKelasButton(this.kelas);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/absensi2');
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        width: 80,
        height: 40,
        decoration: BoxDecoration(
            // gradient: RadialGradient(
            //   center: Alignment.center,
            //   radius: 0.95,
            //   colors: [Colors.white, Color(0xFFF61a6cf)],
            // ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  spreadRadius: 0.2,
                  offset: Offset(0.0, 0.5))
            ]),
        child: Center(
          child: Text(
            kelas,
            style: GoogleFonts.luxuriousRoman(
                fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
