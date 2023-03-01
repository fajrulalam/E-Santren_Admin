import 'package:dotted_border/dotted_border.dart';
import 'package:esantren_v1/Classes/SejarahPembayaranClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../Objects/SejarahPembayaranObject.dart';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TambahanPembayaranBS extends StatelessWidget {
  TambahanPembayaranBS({
    Key? key,
    required this.onSave,
    required this.nama,
    required this.id,
    required this.dataSejarahPembayaran,
  }) : super(key: key);

  Function(BuildContext context, List<SejarahPembayaranObject> pembayaranBaru)
      onSave;
  final String nama;
  final String id;
  List<SejarahPembayaranInvoiceObject> dataSejarahPembayaran;

  void initState() {}

  @override
  Widget build(BuildContext context) {
    List<bool> bayarCheckbox = [];

    int jumlahTagihan =
        SejarahPembayaranClass(id).getJumlahTagihan(dataSejarahPembayaran);

    String total_str = "Rp 0";
    for (int i = 0; i < jumlahTagihan; i++) {
      bayarCheckbox.add(false);
    }

    String selectedValue = "";

    String countTotal() {
      int index = 0;
      int total = 0;
      bayarCheckbox.forEach((element) {
        if (element == true) {
          total = total + dataSejarahPembayaran[index].nominal;
        }
      });

      return 'Rp ${NumberFormat.decimalPattern().format(total).replaceAll(",", ".")}';
    }

    // final keteranganController = TextEditingController();

    dataSejarahPembayaran = dataSejarahPembayaran.where((element) {
      return element.lunas == false;
    }).toList();

    return StatefulBuilder(builder: (context, setState) {
      return SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.9,
            minHeight: 0,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$jumlahTagihan Tagihan',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                id,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                    fontSize: 12.0,
                    color: Colors.black38),
              ),
              Text(
                nama,
                style: GoogleFonts.poppins(
                  color: Colors.black38,
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Divider(color: Colors.grey, height: 1),
              SizedBox(height: 8.0),
              Container(
                  constraints: BoxConstraints(maxHeight: 265),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: jumlahTagihan,
                    itemBuilder: (context, int index) {
                      return Container(
                        color: bayarCheckbox[index] == true
                            ? Colors.green.withOpacity(0.1)
                            : Colors.white.withOpacity(0),
                        child: Ink(
                          // padding:
                          //     EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                bayarCheckbox[index] = !bayarCheckbox[index];
                                total_str = countTotal();
                              });
                            },
                            child: Container(
                              color: bayarCheckbox[index] == true
                                  ? Colors.green.withOpacity(0.1)
                                  : Colors.white.withOpacity(0),
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 16),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                '${dataSejarahPembayaran[index].pembayaranBulan}',
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                            // Expanded widget for someNumber
                                            Text(
                                              'Rp ${NumberFormat.decimalPattern().format(dataSejarahPembayaran[index].nominal).replaceAll(",", ".")}',
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w700,
                                                  color: bayarCheckbox[index] ==
                                                          true
                                                      ? Colors.green
                                                      : Colors.red
                                                          .withOpacity(0.5)),
                                            ),
                                          ]),
                                      RoundCheckBox(
                                        isChecked: bayarCheckbox[index],
                                        animationDuration:
                                            Duration(milliseconds: 100),
                                        size: 24,
                                        checkedWidget: Icon(
                                          Icons.check,
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                        onTap: (bool? value) {
                                          setState(() {
                                            bayarCheckbox[index] =
                                                !bayarCheckbox[index];
                                            print('${bayarCheckbox[index]}');
                                            total_str = countTotal();
                                          });
                                        },
                                      )

                                      // Expanded widget for date
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [Divider(color: Colors.grey, height: 1)],
                      );
                    },
                  )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: DottedBorder(
                    color: Colors.grey,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total:',
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            total_str,
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    )),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
              //   child: TextFormField(
              //     enabled: true,
              //     controller: keteranganController,
              //     decoration: InputDecoration(
              //       labelText: "Keterangan tambahan",
              //       border: OutlineInputBorder(),
              //     ),
              //   ),
              // ),
              SizedBox(height: 16),
              Expanded(child: Container()),
              Text(
                'Pembayaran diterima oleh: \$nama',
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black45),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                child: Text("Save"),
                onPressed: () {
                  // Add logic to save data and dismiss bottom sheet
                  List<SejarahPembayaranObject> dataPembayaranBaru = [];
                  print(bayarCheckbox.toString());
                  int index = 0;
                  bayarCheckbox.forEach((element) {
                    if (element == true) {
                      dataPembayaranBaru.add(SejarahPembayaranObject(
                        pembayaranBulan:
                            dataSejarahPembayaran[index].pembayaranBulan,
                        tanggalPembayaran:
                            DateTime.now().toString().substring(0, 16),
                        diterimaOleh: 'Mundzir',
                        nominal: dataSejarahPembayaran[index].nominal,
                      ));
                    }
                    index++;
                  });
                  onSave(context, dataPembayaranBaru);
                  Navigator.pop(context, "konfirmasi");
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}

// void tambahPembayaran_BS(BuildContext context, String nama, String id,
//     List<SejarahPembayaranInvoiceObject> dataSejarahPembayaran) {
//   List<bool> bayarCheckbox = [];
//
//   int jumlahTagihan =
//       SejarahPembayaranClass(id).getJumlahTagihan(dataSejarahPembayaran);
//
//   String total_str = "Rp 0";
//   for (int i = 0; i < jumlahTagihan; i++) {
//     bayarCheckbox.add(false);
//   }
//
//   String selectedValue = "";
//
//   String countTotal() {
//     int index = 0;
//     int total = 0;
//     bayarCheckbox.forEach((element) {
//       if (element == true) {
//         total = total + dataSejarahPembayaran[index].nominal;
//       }
//     });
//
//     return 'Rp ${NumberFormat.decimalPattern().format(total).replaceAll(",", ".")}';
//   }
//
//   dataSejarahPembayaran = dataSejarahPembayaran.where((element) {
//     return element.lunas == false;
//   }).toList();
//
//   showModalBottomSheet(
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//     context: context,
//     isScrollControlled: true,
//     builder: (BuildContext context) {
//       return StatefulBuilder(builder: (context, setState) {
//         return SingleChildScrollView(
//           padding:
//               EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
//           child: Container(
//             constraints: BoxConstraints(
//               maxHeight: MediaQuery.of(context).size.height * 0.9,
//               minHeight: 0,
//             ),
//             padding: EdgeInsets.symmetric(horizontal: 20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(height: 16.0),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       '$jumlahTagihan Tagihan',
//                       style: GoogleFonts.poppins(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.0,
//                       ),
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.close),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   id,
//                   style: GoogleFonts.poppins(
//                       fontWeight: FontWeight.normal,
//                       fontSize: 12.0,
//                       color: Colors.black38),
//                 ),
//                 Text(
//                   nama,
//                   style: GoogleFonts.poppins(
//                     color: Colors.black38,
//                     fontWeight: FontWeight.normal,
//                     fontSize: 16.0,
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 Divider(color: Colors.grey, height: 1),
//                 SizedBox(height: 8.0),
//                 Container(
//                     constraints: BoxConstraints(maxHeight: 265),
//                     child: ListView.separated(
//                       shrinkWrap: true,
//                       itemCount: jumlahTagihan,
//                       itemBuilder: (context, int index) {
//                         return Container(
//                           color: bayarCheckbox[index] == true
//                               ? Colors.green.withOpacity(0.1)
//                               : Colors.white.withOpacity(0),
//                           child: Ink(
//                             // padding:
//                             //     EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//                             child: InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   bayarCheckbox[index] = !bayarCheckbox[index];
//                                   total_str = countTotal();
//                                 });
//                               },
//                               child: Container(
//                                 color: bayarCheckbox[index] == true
//                                     ? Colors.green.withOpacity(0.1)
//                                     : Colors.white.withOpacity(0),
//                                 padding: EdgeInsets.symmetric(
//                                     vertical: 16, horizontal: 16),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                   '${dataSejarahPembayaran[index].pembayaranBulan}',
//                                                   style: GoogleFonts.montserrat(
//                                                       fontSize: 16,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: Colors.black)),
//                                               // Expanded widget for someNumber
//                                               Text(
//                                                 'Rp ${NumberFormat.decimalPattern().format(dataSejarahPembayaran[index].nominal).replaceAll(",", ".")}',
//                                                 style: GoogleFonts.montserrat(
//                                                     fontWeight: FontWeight.w700,
//                                                     color:
//                                                         bayarCheckbox[index] ==
//                                                                 true
//                                                             ? Colors.green
//                                                             : Colors.red
//                                                                 .withOpacity(
//                                                                     0.5)),
//                                               ),
//                                             ]),
//                                         RoundCheckBox(
//                                           isChecked: bayarCheckbox[index],
//                                           animationDuration:
//                                               Duration(milliseconds: 100),
//                                           size: 24,
//                                           checkedWidget: Icon(
//                                             Icons.check,
//                                             size: 18,
//                                             color: Colors.white,
//                                           ),
//                                           onTap: (bool? value) {
//                                             setState(() {
//                                               bayarCheckbox[index] =
//                                                   !bayarCheckbox[index];
//                                               print('${bayarCheckbox[index]}');
//                                               total_str = countTotal();
//                                             });
//                                           },
//                                         )
//
//                                         // Expanded widget for date
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                       separatorBuilder: (BuildContext context, int index) {
//                         return Column(
//                           children: [Divider(color: Colors.grey, height: 1)],
//                         );
//                       },
//                     )),
//                 Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: DottedBorder(
//                       color: Colors.grey,
//                       child: Container(
//                         padding: EdgeInsets.all(12),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               'Total:',
//                               style: GoogleFonts.montserrat(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black),
//                             ),
//                             Text(
//                               total_str,
//                               style: GoogleFonts.montserrat(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black),
//                             ),
//                           ],
//                         ),
//                       )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                   child: TextFormField(
//                     enabled: true,
//                     decoration: InputDecoration(
//                       labelText: "Keterangan tambahan",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 Expanded(child: Container()),
//                 Text(
//                   'Pembayaran diterima oleh: \$nama',
//                   style: GoogleFonts.poppins(
//                       fontSize: 12,
//                       fontWeight: FontWeight.normal,
//                       color: Colors.black45),
//                 ),
//                 SizedBox(height: 8),
//                 ElevatedButton(
//                   child: Text("Save"),
//                   onPressed: () {
//                     // Add logic to save data and dismiss bottom sheet
//                     Navigator.pop(context);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       });
//     },
//   );
// }
