import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Screens/Absensi2_Absensi.dart';

class AbsenWidget extends StatelessWidget {
  const AbsenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6, left: 16, right: 16),
      child: Ink(
        height: 90,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(20),
            color: Colors.green.withOpacity(0.1)),
        child: InkWell(
          onTap: () {},
          onLongPress: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AbsensiAlertDialog(
                      'test', 'Muhammad Fajrul Alam Ulin Nuha');
                });
          },
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  '21487619',
                  style: GoogleFonts.sourceSansPro(
                      fontSize: 14, color: Colors.black54),
                ),
                margin: EdgeInsets.only(left: 16, top: 12),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Muhammad Fajrul Alam Ulin Nuha',
                  maxLines: 2,
                  style: GoogleFonts.raleway(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                margin: EdgeInsets.only(left: 16, top: 16),
              ),
              Container(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AbsensiAlertDialog(
                              'test', 'Muhammad Fajrul Alam Ulin Nuha');
                        });
                  },
                  child: Text(
                    'HADIR',
                    maxLines: 1,
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0E5805)),
                  ),
                ),
                margin: EdgeInsets.only(right: 16, top: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
