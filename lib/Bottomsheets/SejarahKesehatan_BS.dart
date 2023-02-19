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
                              fontSize: 24, fontWeight: FontWeight.bold),
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
                        fontWeight: FontWeight.w600, fontSize: 18)),
                Text(
                  id!,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
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
                  SizedBox(
                    height: 20,
                  ),
                if (dataSejarahKesehatan.isNotEmpty)
                  Divider(color: Colors.grey, height: 1),
                if (dataSejarahKesehatan.isNotEmpty)
                  Expanded(
                    child: ListView.separated(
                      itemCount: dataSejarahKesehatan.length,
                      itemBuilder: (context, int index) {
                        return ExpansionTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                dataSejarahKesehatan[index].keluhan!,
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                      '${dataSejarahKesehatan[index].updateTimestamp}',
                                      style: GoogleFonts.sourceSansPro(
                                          color:
                                              Colors.black87.withOpacity(0.8),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                  if (dataSejarahKesehatan[index]
                                          .sudahPeriksa ==
                                      true)
                                    Text('     Sudah Periksa',
                                        style: GoogleFonts.sourceSansPro(
                                            color: Colors.green,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))
                                  else
                                    Text('     Belum Periksa',
                                        style: GoogleFonts.sourceSansPro(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                          children: [
                            if (dataSejarahKesehatan[index].sudahPeriksa ==
                                false)
                              Container(
                                margin: EdgeInsets.only(
                                    right: 20, left: 20, top: 4, bottom: 8),
                                child: DottedBorder(
                                  padding: EdgeInsets.all(8),
                                  strokeWidth: 1,
                                  color: Colors.black.withOpacity(0.2),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      TextFormField(
                                        initialValue:
                                            dataSejarahKesehatan[index]
                                                .dirawatDi,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          labelText: 'Dirawat di',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      TextFormField(
                                        initialValue:
                                            dataSejarahKesehatan[index]
                                                .keterangan,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          labelText: 'Keterangan',
                                          border: OutlineInputBorder(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            if (dataSejarahKesehatan[index].sudahPeriksa ==
                                true)
                              Container(
                                margin: EdgeInsets.only(
                                    right: 20, left: 20, top: 4, bottom: 8),
                                child: DottedBorder(
                                  padding: EdgeInsets.all(8),
                                  strokeWidth: 1,
                                  color: Colors.black.withOpacity(0.2),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: TextFormField(
                                              initialValue:
                                                  dataSejarahKesehatan[index]
                                                      .periksaDi,
                                              readOnly: true,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 10),
                                                labelText: 'Periksa oleh/di',
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                          Expanded(
                                            flex: 1,
                                            child: TextFormField(
                                              initialValue:
                                                  dataSejarahKesehatan[index]
                                                      .dirawatDi,
                                              readOnly: true,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 10),
                                                labelText: 'Dirawat di',
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: TextFormField(
                                              initialValue:
                                                  dataSejarahKesehatan[index]
                                                      .suhuTubuh
                                                      .toString(),
                                              readOnly: true,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 10),
                                                labelText: 'Periksa oleh/di',
                                                suffixText: '°C',
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                          Expanded(
                                            flex: 1,
                                            child: TextFormField(
                                              initialValue:
                                                  dataSejarahKesehatan[index]
                                                      .tensi,
                                              readOnly: true,
                                              decoration: InputDecoration(
                                                suffixText: 'mm/Hg',
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 10),
                                                labelText: 'Dirawat di',
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      TextFormField(
                                        initialValue:
                                            dataSejarahKesehatan[index]
                                                .diagnosa,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          labelText: 'Diagnosa',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      TextFormField(
                                        initialValue:
                                            dataSejarahKesehatan[index]
                                                .preskripsi,
                                        readOnly: true,
                                        minLines: 1,
                                        maxLines: 3,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          labelText: 'Preskripsi',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            SizedBox(height: 10),
                            Divider(color: Colors.grey, height: 1)
                          ],
                        );
                      },
                    ),
                  ),
                Divider(color: Colors.grey, height: 1)
              ],
            ),
          ),
        );
      });
}
