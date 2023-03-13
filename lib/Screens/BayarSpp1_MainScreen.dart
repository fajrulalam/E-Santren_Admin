import 'package:esantren_v1/AlertDialogs/KesehatanOptionsDialog.dart';
import 'package:esantren_v1/AlertDialogs/PembayaranKonfirmasiDialog.dart';
import 'package:esantren_v1/Classes/AbsenClass.dart';
import 'package:esantren_v1/Objects/AbsenObject.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:esantren_v1/Classes/SejarahPembayaranClass.dart';
import 'package:esantren_v1/Bottomsheets/PembayaranSejarah_BS.dart';
import 'package:intl/intl.dart';

import '../Bottomsheets/PembayaranTambahPembayaran_BS.dart';
import '../Objects/SejarahPembayaranObject.dart';

class BayarSpp1_MainScreen extends StatefulWidget {
  const BayarSpp1_MainScreen({Key? key}) : super(key: key);
  static const String id = 'bayar-spp';

  @override
  State<BayarSpp1_MainScreen> createState() => _BayarSpp1_MainScreenState();
}

class _BayarSpp1_MainScreenState extends State<BayarSpp1_MainScreen> {
  bool _isPressed = false;
  int selectedButtonIndex = 0;
  List<SejarahPembayaranObject> _dataPembayaranBaru = [];
  final controller = TextEditingController();

  String namaTerpilih = "";
  String idTerpilih = "";

  List<AbsenObject> dataPembayaranSPP = AbsenClass().getData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pembayaran SPP Asrama'),
          leading: BackButton(
            color: Colors.grey,
          ),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3))
                ]),
            constraints: BoxConstraints(maxWidth: 800),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: 16,
                      color: Colors.white,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      color: Colors.white,
                      child: TextField(
                        onChanged: (value) {
                          searchSantri(value, selectedButtonIndex);
                        },
                        style: GoogleFonts.poppins(fontSize: 16),
                        controller: controller,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Cari nama santri',
                            focusColor: Colors.black,
                            prefixIconColor: Colors.grey,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.black87)),
                            iconColor: Colors.black87),
                      ),
                    ),
                    Container(color: Colors.white, height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Material(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedButtonIndex = 0;
                                  searchSantri(
                                      controller.text, selectedButtonIndex);
                                });
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: selectedButtonIndex == 0
                                      ? Colors.blue.withOpacity(0.8)
                                      : Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: selectedButtonIndex == 0
                                        ? Colors.blueAccent.withOpacity(0.75)
                                        : Colors.grey.shade700,
                                    width: 2.0,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Semua",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    if (selectedButtonIndex == 0)
                                      SizedBox(width: 5),
                                    if (selectedButtonIndex == 0)
                                      Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(width: 10, color: Colors.white),
                          Material(
                            // color: selectedButtonIndex == 0
                            //     ? Colors.blue.withOpacity(0.5)
                            //     : Colors.grey.withOpacity(0.3),
                            // borderRadius: BorderRadius.circular(12.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedButtonIndex = 1;
                                  searchSantri(
                                      controller.text, selectedButtonIndex);
                                });
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: selectedButtonIndex == 1 ||
                                          selectedButtonIndex == 0
                                      ? Colors.blue.withOpacity(0.8)
                                      : Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: selectedButtonIndex == 1 ||
                                            selectedButtonIndex == 0
                                        ? Colors.blueAccent.withOpacity(0.75)
                                        : Colors.grey.shade700,
                                    width: 2.0,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Belum Lunas",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    if (selectedButtonIndex == 1 ||
                                        selectedButtonIndex == 0)
                                      SizedBox(width: 5),
                                    if (selectedButtonIndex == 1 ||
                                        selectedButtonIndex == 0)
                                      Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(width: 10, color: Colors.white),
                          Material(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedButtonIndex = 2;
                                  searchSantri(
                                      controller.text, selectedButtonIndex);
                                });
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: selectedButtonIndex == 2 ||
                                          selectedButtonIndex == 0
                                      ? Colors.blue.withOpacity(0.8)
                                      : Colors.grey.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: selectedButtonIndex == 2 ||
                                            selectedButtonIndex == 0
                                        ? Colors.blueAccent.withOpacity(0.75)
                                        : Colors.grey.shade700,
                                    width: 2.0,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Lunas",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    if (selectedButtonIndex == 2 ||
                                        selectedButtonIndex == 0)
                                      SizedBox(width: 10),
                                    if (selectedButtonIndex == 2 ||
                                        selectedButtonIndex == 0)
                                      Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(height: 10, color: Colors.white),
                    Divider(color: Colors.grey, height: 1),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: ListView.builder(
                          itemCount: dataPembayaranSPP.length,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, int index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 4, top: 4),
                              child: Material(
                                child: Ink(
                                  height: 120,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              dataPembayaranSPP[index].lunasSPP
                                                  ? Colors.green
                                                  : Colors.red.withOpacity(0.8),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(20),
                                      color: dataPembayaranSPP[index].lunasSPP
                                          ? Colors.green.withOpacity(0.1)
                                          : Colors.red.withOpacity(0.1)),
                                  child: InkWell(
                                    onTap: () {
                                      namaTerpilih =
                                          dataPembayaranSPP[index].nama;
                                      idTerpilih = dataPembayaranSPP[index].id;
                                      sejarahPembayaran_BS(
                                          context,
                                          SejarahPembayaranClass(
                                                  dataPembayaranSPP[index].id)
                                              .getSejarahPembayaranInvoice(),
                                          nama: dataPembayaranSPP[index].nama,
                                          id: dataPembayaranSPP[index].id);
                                    },
                                    onLongPress: () {
                                      namaTerpilih =
                                          dataPembayaranSPP[index].nama;
                                      idTerpilih = dataPembayaranSPP[index].id;
                                      showModalBottomSheet(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return TambahanPembayaranBS(
                                                onSave: _onSave,
                                                nama: dataPembayaranSPP[index]
                                                    .nama,
                                                id: dataPembayaranSPP[index].id,
                                                dataSejarahPembayaran:
                                                    SejarahPembayaranClass(
                                                            dataPembayaranSPP[
                                                                    index]
                                                                .id)
                                                        .getSejarahPembayaranInvoice());
                                          }).then((value) {
                                        if (value.toString() == "konfirmasi") {
                                          print('this should open dialog');
                                          openDialog(context);
                                        }
                                      });
                                      // tambahPembayaran_BS(
                                      //     context,
                                      //     dataPembayaranSPP[index].nama,
                                      //     dataPembayaranSPP[index].id,
                                      //     SejarahPembayaranClass(
                                      //             dataPembayaranSPP[index].id)
                                      //         .getSejarahPembayaranInvoice());
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Text(
                                                  dataPembayaranSPP[index].id,
                                                  style:
                                                      GoogleFonts.sourceSansPro(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black54),
                                                ),
                                              ),
                                              if (dataPembayaranSPP[index]
                                                      .lunasSPP ==
                                                  true)
                                                Container(
                                                  alignment: Alignment.topRight,
                                                  child: Text(
                                                    "LUNAS",
                                                    maxLines: 2,
                                                    style: GoogleFonts.raleway(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              if (dataPembayaranSPP[index]
                                                      .lunasSPP ==
                                                  false)
                                                Container(
                                                  alignment: Alignment.topRight,
                                                  child: Text(
                                                    "BAYAR",
                                                    maxLines: 2,
                                                    style: GoogleFonts.raleway(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                            ],
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.only(top: 12),
                                            child: Text(
                                              dataPembayaranSPP[index].nama,
                                              maxLines: 2,
                                              style: GoogleFonts.raleway(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 8),
                                            child: Text(
                                              'Pembayaran terakhir : 16-12-23',
                                              style: GoogleFonts.sourceSansPro(
                                                  fontSize: 16,
                                                  color: Colors.black38
                                                      .withOpacity(0.5),
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void _onSave(
      BuildContext context, List<SejarahPembayaranObject> pembayaranBaru) {
    _dataPembayaranBaru = pembayaranBaru;

    String bulanYangDibayar = "";
    int totalNominal = 0;

    pembayaranBaru.forEach((element) {
      bulanYangDibayar += ' ${element.pembayaranBulan},';
      totalNominal += element.nominal!;
    });

    String totalNominal_str =
        'Rp ${NumberFormat.decimalPattern().format(totalNominal).replaceAll(",", ".")}';
    print(bulanYangDibayar.substring(0, bulanYangDibayar.length - 1).trim());
    print(totalNominal_str);
    String? bulanPembayaran = pembayaranBaru[0].pembayaranBulan;
    print(bulanPembayaran);

    print('Starting action...');
    assert(context != null);
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return PembayaranKonfirmasiDialog("idTerpilih", "namaTerpilih",
          //     "bulanYangDibayar", "totalNominal_str");
          return KesehatanOptionsDialog("nama", true);
        });
  }

  void searchSantri(String query, int selectedButtonIndex) {
    final searchResult = AbsenClass().getData().where((element) {
      final namaSantri = element.nama.toLowerCase();
      final input = query.toLowerCase();
      switch (selectedButtonIndex) {
        case 0:
          return namaSantri.contains(input);
        case 1:
          return namaSantri.contains(input) && element.lunasSPP == false;
        case 2:
          return namaSantri.contains(input) && element.lunasSPP == true;
        default:
          return namaSantri.contains(input);
      }
      // return namaSantri.contains(input) && element.lunasSPP == true;
      // return element.sudahAdaDetail == true;
    }).toList();

    setState(() {
      dataPembayaranSPP = searchResult;
    });
  }
}
