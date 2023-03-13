import 'package:esantren_v1/Bottomsheets/KesehatanTambahSantriSakit_BS.dart';
import 'package:esantren_v1/Classes/SejarahKesehatanClass.dart';
import 'package:esantren_v1/Objects/KesehatanObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:esantren_v1/Classes/KesehatanClass.dart';
import 'package:esantren_v1/Bottomsheets/KesehatanDetail_BS.dart';
import 'package:esantren_v1/Bottomsheets/KesehatanSejarah_BS.dart';
import 'package:esantren_v1/AlertDialogs/KesehatanOptionsDialog.dart';

import '../AlertDialogs/SudahSembuhDialog.dart';

class Kesehatan1_MainScreen extends StatefulWidget {
  const Kesehatan1_MainScreen({Key? key}) : super(key: key);
  static const String id = 'kesehatan1';

  @override
  State<Kesehatan1_MainScreen> createState() => _Kesehatan1_MainScreenState();
}

class _Kesehatan1_MainScreenState extends State<Kesehatan1_MainScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  KesehatanClass kesehatanClass = new KesehatanClass();
  late List<KesehatanObject> dataKesehatanSantriTanpaKeterangan;
  late List<KesehatanObject> dataKesehatanSantriSudahAdaKeterangan;

  late int perluKeteranganItemCount =
      kesehatanClass.getItemCount(dataKesehatanSantriTanpaKeterangan, false);
  late int lengkapKeternganItemCount =
      kesehatanClass.getItemCount(dataKesehatanSantriTanpaKeterangan, true);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    filterSantriKeterangan();
  }

  @override
  Widget build(BuildContext context) {
    // _tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text("Kesehatan Santri"),
          leading: BackButton(
            color: Colors.grey,
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            controller: _tabController,
            indicatorColor: Colors.black,
            labelStyle: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                GoogleFonts.montserrat(fontWeight: FontWeight.w400),
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'images/perlu-verif.png',
                      height: 20,
                    ),
                    Text('Perlu Keterangan'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/sudah-verif.png',
                      height: 20,
                    ),
                    SizedBox(width: 12),
                    Text('Lengkap'),
                  ],
                ),
              ),
            ],
          )),
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
          child: TabBarView(
            controller: _tabController,
            children: [
              Padding(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: 16, bottom: 1, left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextField(
                              onChanged: searchSantriTanpaKeterangan,
                              style: GoogleFonts.poppins(fontSize: 16),
                              controller: controller1,
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.search),
                                  hintText: 'Cari nama santri',
                                  focusColor: Colors.black,
                                  prefixIconColor: Colors.grey,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          width: 1.5, color: Colors.black87)),
                                  iconColor: Colors.black87),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Material(
                            elevation: 3,
                            shadowColor: Colors.black87,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black87.withOpacity(0.4)),
                                  borderRadius: BorderRadius.circular(16)),
                              child: IconButton(
                                splashRadius: 4,
                                onPressed: () {
                                  tambahSantriSakit_BS(context);
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.black87.withOpacity(0.4),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: ListView.builder(
                          itemCount: dataKesehatanSantriTanpaKeterangan.length,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, int index) {
                            return Container(
                              margin: EdgeInsets.only(top: 6),
                              child: Material(
                                child: Ink(
                                  height: 140,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.redAccent, width: 2),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.redAccent.withOpacity(0.1)),
                                  child: InkWell(
                                    // onDoubleTap: () {
                                    //   sejarahKesehatan_BS(
                                    //       context,
                                    //       SejarahKesehatan().getData(
                                    //           dataKesehatanSantriTanpaKeterangan[
                                    //                   index]
                                    //               .id),
                                    //       nama: dataKesehatanSantriTanpaKeterangan[
                                    //               index]
                                    //           .nama,
                                    //       id: dataKesehatanSantriTanpaKeterangan[
                                    //               index]
                                    //           .id);
                                    // },
                                    onTap: () {
                                      HapticFeedback.vibrate();

                                      Future.delayed(Duration(milliseconds: 50),
                                          () {
                                        kesehatanDetail_BS(
                                            context,
                                            dataKesehatanSantriTanpaKeterangan[
                                                    index]
                                                .nama,
                                            dataKesehatanSantriTanpaKeterangan[
                                                    index]
                                                .id);
                                      });
                                    },
                                    onLongPress: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SudahSembuhDialog(
                                                "",
                                                dataKesehatanSantriTanpaKeterangan[
                                                        index]
                                                    .nama);
                                          }).then((value) {
                                        print(
                                            '${dataKesehatanSantriTanpaKeterangan[index].nama} $value');
                                      });
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.only(left: 8),
                                          child: ClipRRect(
                                            child: Container(
                                              height: 110.0,
                                              width: 70.0,
                                              child: Stack(children: [
                                                Positioned.fill(
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.black,
                                                              width: 1),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  12.0), //or 15.0
                                                          color: Colors.grey,
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'images/foto_formal.jpg'),
                                                              fit: BoxFit
                                                                  .fill))),
                                                ),
                                                Positioned.fill(
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      onTap: () {
                                                        HapticFeedback
                                                            .vibrate();
                                                        Future.delayed(
                                                            Duration(
                                                                milliseconds:
                                                                    50), () {
                                                          sejarahKesehatan_BS(
                                                              context,
                                                              SejarahKesehatan()
                                                                  .getData(
                                                                      dataKesehatanSantriTanpaKeterangan[
                                                                              index]
                                                                          .id),
                                                              nama:
                                                                  dataKesehatanSantriTanpaKeterangan[
                                                                          index]
                                                                      .nama,
                                                              id: dataKesehatanSantriTanpaKeterangan[
                                                                      index]
                                                                  .id);
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            dataKesehatanSantriTanpaKeterangan[
                                                    index]
                                                .id,
                                            style: GoogleFonts.sourceSansPro(
                                                fontSize: 14,
                                                color: Colors.black54),
                                          ),
                                          margin: EdgeInsets.only(
                                              left: 90, top: 17),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            dataKesehatanSantriTanpaKeterangan[
                                                    index]
                                                .nama,
                                            maxLines: 2,
                                            style: GoogleFonts.raleway(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          margin: EdgeInsets.only(
                                              left: 90, top: 0, bottom: 30),
                                        ),
                                        Container(
                                          alignment: Alignment.topRight,
                                          margin:
                                              EdgeInsets.only(right: 8, top: 4),
                                          child: IconButton(
                                            padding: EdgeInsets.all(0),
                                            icon: Icon(Icons.more_horiz),
                                            color:
                                                Colors.black87.withOpacity(0.6),
                                            iconSize: 28,
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return KesehatanOptionsDialog(
                                                        dataKesehatanSantriTanpaKeterangan[
                                                                index]
                                                            .nama,
                                                        dataKesehatanSantriTanpaKeterangan[
                                                                index]
                                                            .sudahAdaDetail);
                                                  }).then((value) {
                                                switch (value) {
                                                  case "Sembuh":
                                                    print(
                                                        '${dataKesehatanSantriTanpaKeterangan[index].nama} $value');
                                                    break;
                                                  case "Lihat Sejarah Sakit":
                                                    sejarahKesehatan_BS(
                                                        context,
                                                        SejarahKesehatan().getData(
                                                            dataKesehatanSantriTanpaKeterangan[
                                                                    index]
                                                                .id),
                                                        nama:
                                                            dataKesehatanSantriTanpaKeterangan[
                                                                    index]
                                                                .nama,
                                                        id: dataKesehatanSantriTanpaKeterangan[
                                                                index]
                                                            .id);
                                                    break;
                                                  case "Tambahkan Detail":
                                                    kesehatanDetail_BS(
                                                        context,
                                                        dataKesehatanSantriTanpaKeterangan[
                                                                index]
                                                            .nama,
                                                        dataKesehatanSantriTanpaKeterangan[
                                                                index]
                                                            .id);
                                                    break;
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Keluhan      : ......',
                                            style: GoogleFonts.sourceSansPro(
                                                fontSize: 16,
                                                color: Colors.black38
                                                    .withOpacity(0.5),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          margin: EdgeInsets.only(
                                              left: 90, bottom: 45),
                                        ),
                                        Container(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            'Dirawat di  : ......',
                                            style: GoogleFonts.sourceSansPro(
                                                fontSize: 16,
                                                color: Colors.black38
                                                    .withOpacity(0.5),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          margin: EdgeInsets.only(
                                              left: 90, bottom: 20),
                                        ),
                                      ],
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
              Padding(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: 16, bottom: 1, left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextField(
                        onChanged: searchSantriSudahAdaKeterangan,
                        style: GoogleFonts.poppins(fontSize: 16),
                        controller: controller2,
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
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: ListView.builder(
                          itemCount:
                              dataKesehatanSantriSudahAdaKeterangan.length,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, int index) {
                            return Container(
                              margin: EdgeInsets.only(top: 6),
                              child: Ink(
                                height: 140,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blueAccent, width: 2),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blueAccent.withOpacity(0.1)),
                                child: InkWell(
                                  onTap: () {
                                    HapticFeedback.vibrate();

                                    Future.delayed(Duration(milliseconds: 50),
                                        () {
                                      kesehatanDetail_BS(
                                          context,
                                          dataKesehatanSantriSudahAdaKeterangan[index]
                                              .nama,
                                          dataKesehatanSantriSudahAdaKeterangan[index]
                                              .id,
                                          keluhan:
                                              dataKesehatanSantriSudahAdaKeterangan[index]
                                                  .keluhan,
                                          dirawatDi:
                                              dataKesehatanSantriSudahAdaKeterangan[index]
                                                  .dirawatDi,
                                          keterangan:
                                              dataKesehatanSantriSudahAdaKeterangan[index]
                                                  .keterangan,
                                          sudahPeriksa:
                                              dataKesehatanSantriSudahAdaKeterangan[index]
                                                  .sudahPeriksa,
                                          periksaDi:
                                              dataKesehatanSantriSudahAdaKeterangan[index]
                                                  .periksaDi,
                                          suhuTubuh:
                                              dataKesehatanSantriSudahAdaKeterangan[index]
                                                  .suhuTubuh,
                                          tensi: dataKesehatanSantriSudahAdaKeterangan[index]
                                              .tensi,
                                          diagnosa:
                                              dataKesehatanSantriSudahAdaKeterangan[index]
                                                  .diagnosa,
                                          preskripsi:
                                              dataKesehatanSantriSudahAdaKeterangan[index]
                                                  .preskripsi,
                                          updateTimestamp:
                                              dataKesehatanSantriSudahAdaKeterangan[index]
                                                  .updateTimestamp);
                                    });
                                  },
                                  onLongPress: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SudahSembuhDialog(
                                              "",
                                              dataKesehatanSantriSudahAdaKeterangan[
                                                      index]
                                                  .nama);
                                        }).then((value) {
                                      print(
                                          '${dataKesehatanSantriSudahAdaKeterangan[index].nama} $value');
                                    });
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(left: 8),
                                        child: ClipRRect(
                                          child: Container(
                                            height: 110.0,
                                            width: 70.0,
                                            child: Stack(children: [
                                              Positioned.fill(
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.black,
                                                            width: 1),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                12.0), //or 15.0
                                                        color: Colors.grey,
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'images/foto_formal.jpg'),
                                                            fit: BoxFit.fill))),
                                              ),
                                              Positioned.fill(
                                                child: Material(
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                    onTap: () {
                                                      sejarahKesehatan_BS(
                                                          context,
                                                          SejarahKesehatan()
                                                              .getData(
                                                                  dataKesehatanSantriSudahAdaKeterangan[
                                                                          index]
                                                                      .id),
                                                          nama:
                                                              dataKesehatanSantriSudahAdaKeterangan[
                                                                      index]
                                                                  .nama,
                                                          id: dataKesehatanSantriSudahAdaKeterangan[
                                                                  index]
                                                              .id);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ]),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          dataKesehatanSantriSudahAdaKeterangan[
                                                  index]
                                              .id,
                                          style: GoogleFonts.sourceSansPro(
                                              fontSize: 14,
                                              color: Colors.black54),
                                        ),
                                        margin:
                                            EdgeInsets.only(left: 90, top: 17),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          dataKesehatanSantriSudahAdaKeterangan[
                                                  index]
                                              .nama,
                                          maxLines: 2,
                                          style: GoogleFonts.raleway(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        margin: EdgeInsets.only(
                                            left: 90, top: 0, bottom: 30),
                                      ),
                                      Container(
                                        alignment: Alignment.topRight,
                                        margin: EdgeInsets.only(
                                            right: 8, bottom: 4),
                                        child: IconButton(
                                          padding: EdgeInsets.all(0),
                                          icon: Icon(Icons.more_horiz),
                                          color:
                                              Colors.black87.withOpacity(0.6),
                                          iconSize: 28,
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return KesehatanOptionsDialog(
                                                      dataKesehatanSantriSudahAdaKeterangan[
                                                              index]
                                                          .nama,
                                                      dataKesehatanSantriSudahAdaKeterangan[
                                                              index]
                                                          .sudahAdaDetail);
                                                }).then((value) {
                                              switch (value) {
                                                case "Sembuh":
                                                  print(
                                                      '${dataKesehatanSantriSudahAdaKeterangan[index].nama} $value');
                                                  break;
                                                case "Lihat Sejarah Sakit":
                                                  sejarahKesehatan_BS(
                                                      context,
                                                      SejarahKesehatan().getData(
                                                          dataKesehatanSantriSudahAdaKeterangan[
                                                                  index]
                                                              .id),
                                                      nama:
                                                          dataKesehatanSantriSudahAdaKeterangan[
                                                                  index]
                                                              .nama,
                                                      id: dataKesehatanSantriSudahAdaKeterangan[
                                                              index]
                                                          .id);
                                                  break;
                                                case "Tambahkan Detail":
                                                  kesehatanDetail_BS(
                                                      context,
                                                      dataKesehatanSantriSudahAdaKeterangan[index]
                                                          .nama,
                                                      dataKesehatanSantriSudahAdaKeterangan[index]
                                                          .id,
                                                      keluhan:
                                                          dataKesehatanSantriSudahAdaKeterangan[index]
                                                              .keluhan,
                                                      dirawatDi:
                                                          dataKesehatanSantriSudahAdaKeterangan[index]
                                                              .dirawatDi,
                                                      keterangan:
                                                          dataKesehatanSantriSudahAdaKeterangan[index]
                                                              .keterangan,
                                                      sudahPeriksa:
                                                          dataKesehatanSantriSudahAdaKeterangan[index]
                                                              .sudahPeriksa,
                                                      periksaDi:
                                                          dataKesehatanSantriSudahAdaKeterangan[index]
                                                              .periksaDi,
                                                      suhuTubuh:
                                                          dataKesehatanSantriSudahAdaKeterangan[index]
                                                              .suhuTubuh,
                                                      tensi:
                                                          dataKesehatanSantriSudahAdaKeterangan[index]
                                                              .tensi,
                                                      diagnosa:
                                                          dataKesehatanSantriSudahAdaKeterangan[index]
                                                              .diagnosa,
                                                      preskripsi:
                                                          dataKesehatanSantriSudahAdaKeterangan[index]
                                                              .preskripsi,
                                                      updateTimestamp:
                                                          dataKesehatanSantriSudahAdaKeterangan[index]
                                                              .updateTimestamp);
                                                  break;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        child: RichText(
                                          text: TextSpan(
                                              text: 'Keluhan      : ',
                                              style: GoogleFonts.sourceSansPro(
                                                  fontSize: 16,
                                                  color: Colors.black38
                                                      .withOpacity(0.5),
                                                  fontWeight: FontWeight.bold),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: dataKesehatanSantriSudahAdaKeterangan[
                                                            index]
                                                        .keluhan,
                                                    style: GoogleFonts
                                                        .sourceSansPro(
                                                            fontSize: 16,
                                                            color: Colors
                                                                .black38
                                                                .withOpacity(
                                                                    0.5),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal))
                                              ]),
                                        ),
                                        margin: EdgeInsets.only(
                                            left: 90, bottom: 45),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        child: RichText(
                                          text: TextSpan(
                                              text: 'Dirawat di  : ',
                                              style: GoogleFonts.sourceSansPro(
                                                  fontSize: 16,
                                                  color: Colors.black38
                                                      .withOpacity(0.5),
                                                  fontWeight: FontWeight.bold),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: dataKesehatanSantriSudahAdaKeterangan[
                                                            index]
                                                        .dirawatDi,
                                                    style: GoogleFonts
                                                        .sourceSansPro(
                                                            fontSize: 16,
                                                            color: Colors
                                                                .black38
                                                                .withOpacity(
                                                                    0.5),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal))
                                              ]),
                                        ),
                                        margin: EdgeInsets.only(
                                            left: 90, bottom: 20),
                                      ),
                                    ],
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
            ],
          ),
        ),
      ),
    );
  }

  void searchSantriTanpaKeterangan(String query) {
    final searchResult = KesehatanClass().getData().where((element) {
      final namaSantri = element.nama.toLowerCase();
      final input = query.toLowerCase();

      return namaSantri.contains(input) && element.sudahAdaDetail == false;
      // return element.sudahAdaDetail == true;
    }).toList();

    setState(() {
      dataKesehatanSantriTanpaKeterangan = searchResult;
    });
  }

  void searchSantriSudahAdaKeterangan(String query) {
    final searchResult = KesehatanClass().getData().where((element) {
      final namaSantri = element.nama.toLowerCase();
      final input = query.toLowerCase();

      return namaSantri.contains(input) && element.sudahAdaDetail == true;
      // return element.sudahAdaDetail == true;
    }).toList();

    setState(() {
      dataKesehatanSantriSudahAdaKeterangan = searchResult;
    });
  }

  void filterSantriKeterangan() {
    final searchResultSudahAdaKetrangan =
        KesehatanClass().getData().where((element) {
      return element.sudahAdaDetail == true;
      // return element.sudahAdaDetail == true;
    }).toList();

    final searchResultTanpaKeterangan =
        KesehatanClass().getData().where((element) {
      return element.sudahAdaDetail == false;
      // return element.sudahAdaDetail == true;
    }).toList();

    setState(() {
      dataKesehatanSantriTanpaKeterangan = searchResultTanpaKeterangan;
      dataKesehatanSantriSudahAdaKeterangan = searchResultSudahAdaKetrangan;
    });
  }
}
