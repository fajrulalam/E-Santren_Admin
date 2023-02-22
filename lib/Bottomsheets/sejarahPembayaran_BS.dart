import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:google_fonts/google_fonts.dart';

import '../Objects/SejarahPembayaranObject.dart';

void sejarahPembayaran_BS(BuildContext context,
    List<SejarahPembayaranInvoiceObject> dataSejarahPembayaranSPP,
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
                if (dataSejarahPembayaranSPP.isEmpty)
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
                            'Belum pernah melakukan pembayaran. Kamu santri baru, ya!',
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87.withOpacity(0.8)),
                          ),
                        ),
                        // SizedBox(height: 70)
                      ],
                    ),
                  ),
                if (dataSejarahPembayaranSPP.isNotEmpty)
                  SizedBox(
                    height: 20,
                  ),
                if (dataSejarahPembayaranSPP.isNotEmpty)
                  Divider(color: Colors.grey, height: 1),
                if (dataSejarahPembayaranSPP.isNotEmpty)
                  Expanded(
                    child: ListView.separated(
                      itemCount: dataSejarahPembayaranSPP.length,
                      itemBuilder: (context, int index) {
                        return ExpansionTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                dataSejarahPembayaranSPP[index].pembayaranBulan,
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                      '${dataSejarahPembayaranSPP[index].tanggalPembayaran}',
                                      style: GoogleFonts.sourceSansPro(
                                          color:
                                              Colors.black87.withOpacity(0.8),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                  if (dataSejarahPembayaranSPP[index].lunas ==
                                      true)
                                    Text('     Lunas',
                                        style: GoogleFonts.sourceSansPro(
                                            color: Colors.green,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))
                                  else
                                    Text('     Belum Lunas',
                                        style: GoogleFonts.sourceSansPro(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                          children: [
                            if (dataSejarahPembayaranSPP[index].lunas == true)
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
                                                    dataSejarahPembayaranSPP[
                                                            index]
                                                        .diterimaOleh,
                                                readOnly: true,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 5,
                                                          horizontal: 10),
                                                  labelText: 'Diterima oleh',
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            SizedBox(height: 10),
                                            TextFormField(
                                              initialValue:
                                                  dataSejarahPembayaranSPP[
                                                          index]
                                                      .keterangan,
                                              readOnly: true,
                                              minLines: 1,
                                              maxLines: 3,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 10),
                                                labelText: 'Preskripsi',
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      ]),
                                ),
                              )
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
