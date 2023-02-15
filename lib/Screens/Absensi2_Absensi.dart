import 'package:esantren_v1/CustomWidgets/AbsenWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:esantren_v1/CustomWidgets/PilihanKamar.dart';
import 'package:esantren_v1/Classes/AbsenClass.dart';
import 'package:esantren_v1/Objects/AbsenObject.dart';

class Absensi2_Absensi extends StatefulWidget {
  final String kelas;

  const Absensi2_Absensi({Key? key, this.kelas = 'lol'}) : super(key: key);
  // const Absensi2_Absensi({Key? key}) : super(key: key);

  @override
  State<Absensi2_Absensi> createState() => _Absensi2_AbsensiState(kelas);
}

class _Absensi2_AbsensiState extends State<Absensi2_Absensi> {
  String kelas;
  _Absensi2_AbsensiState(this.kelas);

  final List<String> nomorKamar = <String>[
    'Kamar 1',
    'Kamar 2',
    'Kamar 3',
    'Kamar 4',
    'Kamar 5',
    'Kamar 6'
  ];
  int _selectedIndex = 0;

  // _Absensi2_AbsensiState(this.kelas);

  AbsenClass absenBrain = new AbsenClass();

  //getData
  late List<AbsenObject> dataSantri = absenBrain.getData();
  late int jumlahSantriDiKamar =
      absenBrain.getJumlahSantriDiKamar('Kamar 1', dataSantri);
  late List<AbsenObject> dataSantriSesuaiKamar = [];

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments;
    kelas = arg as String;

    dataSantri.forEach((element) {
      if (element.kamar == 'Kamar 1') {
        dataSantriSesuaiKamar.add(element);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Absensi $kelas"),
        leading: BackButton(
          color: Colors.grey,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 8),
              child: Text(
                'Pilihan Kamar',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 16),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                itemBuilder: (context, int index) {
                  Color color = Colors.white;
                  if (index == _selectedIndex) {
                    color = Colors.blue.withOpacity(0.8);
                  }
                  return PilihanKamarButton(
                      color,
                      InkWell(
                        onTap: () {
                          setState(() {
                            jumlahSantriDiKamar =
                                absenBrain.getJumlahSantriDiKamar(
                                    nomorKamar[index], dataSantri);
                            _selectedIndex = index;
                            print('Data Santri ${dataSantri.toString()}');
                            print('Kamar yang dipilih: ${nomorKamar[index]}');
                            print(
                                'Jumlah santri di kamar: $jumlahSantriDiKamar');
                            dataSantriSesuaiKamar.clear();
                            dataSantri.forEach((element) {
                              if (element.kamar == nomorKamar[index]) {
                                dataSantriSesuaiKamar.add(element);
                              }
                            });
                          });
                        },
                        child: Center(
                          child: Text('${nomorKamar[index]}',
                              style: GoogleFonts.raleway(
                                  color: index == _selectedIndex
                                      ? Colors.white
                                      : null,
                                  fontWeight: index == _selectedIndex
                                      ? FontWeight.bold
                                      : null)),
                        ),
                      ));
                },
                scrollDirection: Axis.horizontal,
                itemCount: nomorKamar.length,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, int index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 6, left: 16, right: 16),
                      child: Ink(
                        height: 90,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: decideBorderColor(
                                    dataSantriSesuaiKamar[index]
                                        .statusKehadiran),
                                width: 2),
                            borderRadius: BorderRadius.circular(20),
                            color: decideBackgroudColor(
                                dataSantriSesuaiKamar[index].statusKehadiran)),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              int indexOfClicked = dataSantri
                                  .indexOf(dataSantriSesuaiKamar[index]);

                              String currentKehadiranStatus =
                                  dataSantri[indexOfClicked].statusKehadiran;
                              print(currentKehadiranStatus);

                              if (currentKehadiranStatus == 'Hadir') {
                                dataSantri[indexOfClicked].statusKehadiran =
                                    'Alfa';
                                dataSantriSesuaiKamar[index].statusKehadiran =
                                    'Alfa';
                              } else {
                                dataSantri[indexOfClicked].statusKehadiran =
                                    'Hadir';
                                dataSantriSesuaiKamar[index].statusKehadiran =
                                    'Hadir';
                              }

                              // dataSantriSesuaiKamar.clear();
                              // dataSantri.forEach((element) {
                              //   if (element.kamar == nomorKamar[index]) {
                              //     dataSantriSesuaiKamar.add(element);
                              //   }
                              // });
                            });
                          },
                          onLongPress: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AbsensiAlertDialog('test',
                                      dataSantriSesuaiKamar[index].nama);
                                }).then((value) {
                              setState(() {
                                int indexOfClicked = dataSantri
                                    .indexOf(dataSantriSesuaiKamar[index]);
                                dataSantri[indexOfClicked].statusKehadiran =
                                    value;
                                dataSantriSesuaiKamar[index].statusKehadiran =
                                    value;
                              });
                            });
                          },
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  dataSantriSesuaiKamar[index].id,
                                  style: GoogleFonts.sourceSansPro(
                                      fontSize: 14, color: Colors.black54),
                                ),
                                margin: EdgeInsets.only(left: 16, top: 12),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  dataSantriSesuaiKamar[index].nama,
                                  maxLines: 2,
                                  style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                                              'test',
                                              dataSantriSesuaiKamar[index]
                                                  .nama);
                                        }).then((value) {
                                      setState(() {
                                        int indexOfClicked = dataSantri.indexOf(
                                            dataSantriSesuaiKamar[index]);
                                        dataSantri[indexOfClicked]
                                            .statusKehadiran = value;
                                        dataSantriSesuaiKamar[index]
                                            .statusKehadiran = value;
                                      });
                                    });
                                    ;
                                  },
                                  child: Text(
                                    dataSantriSesuaiKamar[index]
                                        .statusKehadiran,
                                    maxLines: 1,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: dataSantriSesuaiKamar[index]
                                                    .statusKehadiran ==
                                                'Hadir'
                                            ? Color(0xFF0E5805)
                                            : Colors.black.withOpacity(0.8)),
                                  ),
                                ),
                                margin: EdgeInsets.only(right: 16, top: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                    ;
                  },
                  itemCount: jumlahSantriDiKamar),
            )
            // Container(
            //   margin: EdgeInsets.only(bottom: 6, left: 16, right: 16),
            //   child: Ink(
            //     height: 90,
            //     decoration: BoxDecoration(
            //         border: Border.all(color: Colors.grey, width: 2),
            //         borderRadius: BorderRadius.circular(20),
            //         color: Colors.grey.withOpacity(0.4)),
            //     child: InkWell(
            //       onTap: () {},
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Color decideBorderColor(String dataKehadiran) {
    if (dataKehadiran == 'Hadir') {
      return Colors.green;
    } else if (dataKehadiran == 'Sakit') {
      return Colors.red.withOpacity(0.8);
    } else if (dataKehadiran == 'Izin') {
      return Colors.yellow;
    }

    return Colors.grey;
  }

  Color decideBackgroudColor(String dataKehadiran) {
    if (dataKehadiran == 'Hadir') {
      return Colors.green.withOpacity(0.1);
    } else if (dataKehadiran == 'Sakit') {
      return Colors.red.withOpacity(0.1);
    } else if (dataKehadiran == 'Izin') {
      return Colors.yellow.withOpacity(0.1);
    }

    return Colors.grey.withOpacity(0.1);
  }
}

class AbsensiAlertDialog extends StatelessWidget {
  final title;
  final nama;

  AbsensiAlertDialog(this.title, this.nama);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            color: Colors.orangeAccent.withOpacity(0.4),
            height: 200,
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
                          Navigator.pop(context, "Sakit");
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(4, 12, 4, 12),
                          child: Container(
                            child: Center(
                              child: Text(
                                'Sakit',
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
                          Navigator.pop(context, "Izin");
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(4, 12, 4, 12),
                          child: Container(
                            child: Center(
                              child: Text(
                                'Izin',
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
          Positioned(
            top: -45,
            child: Ink(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40)),
              child: InkWell(
                onTap: () {},
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    backgroundImage: AssetImage('images/coba.jpg')),
              ),
            ),
          )
        ],
      ),
    );
  }
}
