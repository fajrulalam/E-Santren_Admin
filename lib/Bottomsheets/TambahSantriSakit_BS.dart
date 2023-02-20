import 'package:dotted_border/dotted_border.dart';
import 'package:esantren_v1/Classes/AbsenClass.dart';
import 'package:esantren_v1/Objects/AbsenObject.dart';
import 'package:esantren_v1/Objects/KesehatanObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void tambahSantriSakit_BS(BuildContext context) {
  final controller = TextEditingController();

  List<AbsenObject> dataSantriLengkap = AbsenClass().getData();

  void searchSantri(String query) {
    // final searchResult = AbsenClass().getData().where((element) {
    //   final namaSantri = element.nama.toLowerCase();
    //   final input = query.toLowerCase();
    //
    //   return namaSantri.contains(input);
    //   // return element.sudahAdaDetail == true;
    // }).toList();
    //
    // setState(() {
    //   dataSantriLengkap = searchResult;
    // });
  }

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
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
                            "Tambah Santri Sakit",
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
                  TextField(
                    onChanged: (String query) {
                      final searchResult =
                          AbsenClass().getData().where((element) {
                        final namaSantri = element.nama.toLowerCase();
                        final input = query.toLowerCase();

                        return namaSantri.contains(input);
                        // return element.sudahAdaDetail == true;
                      }).toList();

                      setState(() {
                        dataSantriLengkap = searchResult;
                      });
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
                            borderSide:
                                BorderSide(width: 1.5, color: Colors.black87)),
                        iconColor: Colors.black87),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(color: Colors.grey, height: 1),
                  Expanded(
                      child: ListView.separated(
                    itemCount: dataSantriLengkap.length,
                    itemBuilder: (context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(milliseconds: 750),
                              content: Text(
                                  'Tambah Data ${dataSantriLengkap[index].nama}'),
                            ),
                          );
                        },
                        // The splash color you want to use
                        child: ListTile(
                          title: Text(dataSantriLengkap[index].nama),
                          subtitle: Text(dataSantriLengkap[index].id),
                        ),
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
                  )),
                  Divider(color: Colors.grey, height: 1)
                ],
              ),
            ),
          );
        });
      });
}
