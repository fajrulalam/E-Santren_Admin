import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KesehatanOptionsDialog extends StatelessWidget {
  final nama;
  final bool sudahAdaDetail;

  KesehatanOptionsDialog(this.nama, this.sudahAdaDetail);

  @override
  Widget build(BuildContext context) {
    String opsi3 = "Tambahkan Detail";
    if (sudahAdaDetail == true) {
      opsi3 = "Update Detail";
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            color: Colors.blueGrey.withOpacity(0.4),
            height: 240,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 40, 16, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    nama,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    color: Colors.white30,
                    margin: EdgeInsets.only(left: 8, top: 24, right: 8),
                    child: Ink(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4)),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context, "Sembuh");
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(4, 12, 4, 12),
                          child: Container(
                            child: Center(
                              child: Text(
                                'Sudah Sembuh',
                                style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white30,
                    margin: EdgeInsets.only(left: 8, top: 8, right: 8),
                    child: Ink(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4)),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context, "Lihat Sejarah Sakit");
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(4, 12, 4, 12),
                          child: Container(
                            child: Center(
                              child: Text(
                                'Lihat Sejarah Sakit',
                                style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white30,
                    margin: EdgeInsets.only(left: 8, top: 8, right: 8),
                    child: Ink(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4)),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context, "Tambahkan Detail");
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(4, 12, 4, 12),
                          child: Container(
                            child: Center(
                              child: Text(
                                opsi3,
                                style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
