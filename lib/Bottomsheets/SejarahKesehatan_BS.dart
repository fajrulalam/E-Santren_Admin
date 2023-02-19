import 'package:dotted_border/dotted_border.dart';
import 'package:esantren_v1/Objects/KesehatanObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void sejarahKesehatan_BS(
    BuildContext context, List<KesehatanObject> dataSejarahKesehatan,
    {String? nama, String? id}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: FractionallySizedBox(
            heightFactor: 0.95,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 24),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sejarah Sakit",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),

                Text(nama!,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 14)),
                Text(
                  id!,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12.0,
                      color: Colors.black38),
                ),
                SizedBox(height: 20.0),
                if (dataSejarahKesehatan.isEmpty)
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(height: 50),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Center(
                            child: Image.asset(
                              'images/siswa_sehat.png',
                              opacity: AlwaysStoppedAnimation(.8),
                              height: 200,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            'Belum ada sejarah sakit',
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87.withOpacity(0.8)),
                          ),
                        ),
                        // SizedBox(height: 70)
                      ],
                    ),
                  ),
                if (dataSejarahKesehatan.isNotEmpty)
                  Expanded(
                      child: ListView.builder(
                          itemCount: dataSejarahKesehatan.length,
                          itemBuilder: (context, int index) {
                            return ExpansionTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dataSejarahKesehatan[index].keluhan!,
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          '${dataSejarahKesehatan[index].updateTimestamp}',
                                          style: GoogleFonts.sourceSansPro(
                                              color: Colors.black87
                                                  .withOpacity(0.8),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500)),
                                      if (dataSejarahKesehatan[index]
                                              .sudahPeriksa ==
                                          true)
                                        Text('     Sudah Periksa',
                                            style: GoogleFonts.sourceSansPro(
                                                color: Colors.green,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold))
                                      else
                                        Text('     Belum Periksa',
                                            style: GoogleFonts.sourceSansPro(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                              children: [],
                            );
                          }))
                //   Ex
              ],
            ),
          ),
        );
      });
}
