import 'package:esantren_v1/Classes/DropDownValues.dart';
import 'package:esantren_v1/Classes/SantriBaruClass.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:intl/intl.dart';

class SantiBaru_MainPage extends StatefulWidget {
  const SantiBaru_MainPage({Key? key}) : super(key: key);
  static const String id = 'santribaru';

  @override
  State<SantiBaru_MainPage> createState() => _SantiBaru_MainPageState();
}

class _SantiBaru_MainPageState extends State<SantiBaru_MainPage> {
  DateTime selectedDate = DateTime.now();
  String nama = '';
  String alamat = '';
  String namaWali = '';
  String noHP = '';
  String tglLahir = '';
  String kotaAsal = '';
  String jenjangPendidikan = '';
  String kelas = '';
  String unitSekolah = '';
  String kamar = '';
  String kelasMengaji = '';
  late TextEditingController namaController;
  late TextEditingController alamatController;
  late TextEditingController waliSantriController;
  late TextEditingController noHPController;

  @override
  void initState() {
    super.initState();
    tglLahir = '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}';
    namaController = TextEditingController();
    alamatController = TextEditingController();
    waliSantriController = TextEditingController();
    noHPController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    const double sizedBoxHeight = 18;

    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Santri Baru"),
        leading: BackButton(
          color: Colors.grey,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16, bottom: 1, left: 8, right: 8),
        child: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Masukkan Data Santri',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87),
                ),
                SizedBox(height: sizedBoxHeight),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: namaController,
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: sizedBoxHeight),
                TextFormField(
                  controller: alamatController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Alamat Rumah',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: sizedBoxHeight),
                TextFormField(
                  controller: waliSantriController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Wali Santri',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: sizedBoxHeight),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: noHPController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Nomor Telpon',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: sizedBoxHeight),
                    Expanded(
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        readOnly: true,
                        controller: TextEditingController(text: tglLahir),
                        decoration: InputDecoration(
                          labelText: 'Tanggal Lahir',
                          border: OutlineInputBorder(),
                          suffix: GestureDetector(
                            child: Icon(
                              Icons.calendar_today,
                              size: 24,
                            ),
                            onTap: () {
                              print('tapped');
                              // controllerNama.text = 'lol';
                              showDatePicker(
                                locale: Locale('id'),
                                context: context,
                                initialDate: selectedDate,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                                builder: (BuildContext context, Widget? child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary: Colors.blue,
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              ).then((picked) {
                                if (picked != null && picked != selectedDate) {
                                  final DateFormat formatter =
                                      DateFormat('dd-MM-yyyy');
                                  final String formattedDate =
                                      formatter.format(picked);
                                  setState(() {
                                    tglLahir = formattedDate;
                                  });
                                  // controllerTglLahir.text = tglLahir;

                                  // tglLahir = formattedDate;
                                }
                              });
                            },
                          ),
                        ),
                        // readOnly: true,
                        // initialValue: controllerTglLahir.text,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: sizedBoxHeight),
                DropdownSearch<String>(
                  popupProps: PopupProps.menu(
                    showSelectedItems: true,
                    showSearchBox: true,
                  ),
                  items: DropdownValues.getDataKota(),
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        labelText: "Kota Asal",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        )),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      kotaAsal = value;
                    }
                  },
                ),
                SizedBox(height: sizedBoxHeight),
                Row(
                  children: [
                    Expanded(
                      child: DropdownSearch<String>(
                        popupProps: PopupProps.menu(
                          showSelectedItems: true,
                          showSearchBox: false,
                        ),
                        items: ['SD', 'SLTP', 'SLTA'],
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              labelText: "Jenjang Pendidikan",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              )),
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            jenjangPendidikan = value;
                          }
                        },
                      ),
                    ),
                    SizedBox(width: sizedBoxHeight),
                    Expanded(
                      child: DropdownSearch<String>(
                        popupProps: PopupProps.menu(
                          showSelectedItems: true,
                          showSearchBox: false,
                        ),
                        items: ['SD', 'VII', 'VII', 'IX', 'X', 'XI', 'XII'],
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              labelText: "Kelas",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              )),
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            kelas = value;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: sizedBoxHeight),
                DropdownSearch<String>(
                  popupProps: PopupProps.menu(
                    showSelectedItems: true,
                    showSearchBox: true,
                  ),
                  items: DropdownValues.getUnitPendidikan(),
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        labelText: "Unit Pendidikan",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        )),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      unitSekolah = value;
                    }
                  },
                ),
                SizedBox(height: sizedBoxHeight),
                Row(
                  children: [
                    Expanded(
                      child: DropdownSearch<String>(
                        popupProps: PopupProps.menu(
                          showSelectedItems: true,
                          showSearchBox: true,
                        ),
                        items: DropdownValues.getDataKamar(),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              labelText: "Kamar",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              )),
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            kamar = value;
                          }
                        },
                      ),
                    ),
                    SizedBox(width: sizedBoxHeight),
                    Expanded(
                      child: DropdownSearch<String>(
                        popupProps: PopupProps.menu(
                          showSelectedItems: true,
                          showSearchBox: true,
                        ),
                        items: DropdownValues.getKelasMengaji(),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                              labelText: "Kelas Mengaji",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              )),
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            kelasMengaji = value;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: sizedBoxHeight),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            nama = namaController.text;
                            alamat = alamatController.text;
                            namaWali = waliSantriController.text;
                            noHP = noHPController.text;
                            print('Nama ${namaController.text}');
                            print('Alamat ${alamatController.text}');
                            print(
                                'waliSantriController ${waliSantriController.text}');
                            print('noHPController ${noHPController.text}');
                            print(
                                'waliSantriController ${waliSantriController.text}');
                            print('kotaAsal $kotaAsal');
                            print('jenjangPendidikan $jenjangPendidikan');
                            print('kelas $kelas');
                            print('unitPendidikan $unitSekolah');
                            print('kamar $kamar');
                            print('kelasMengaji $kelasMengaji');

                            SantriBaru santriBaru = SantriBaru.named(
                                nama,
                                alamat,
                                noHP,
                                tglLahir,
                                kotaAsal,
                                namaWali,
                                kelas,
                                jenjangPendidikan,
                                unitSekolah,
                                kamar,
                                kelasMengaji);

                            santriBaru.addToFirebase(context, santriBaru);
                          },
                          child: Text(
                            'Simpan Data Santri',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    SizedBox(height: sizedBoxHeight),
                  ],
                ),
                SizedBox(height: sizedBoxHeight + 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
