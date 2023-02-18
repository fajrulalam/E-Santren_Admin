import 'package:esantren_v1/Objects/KesehatanObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:esantren_v1/Classes/KesehatanClass.dart';
import 'package:dotted_border/dotted_border.dart';

class Kesehatan1_MainScreen extends StatefulWidget {
  const Kesehatan1_MainScreen({Key? key}) : super(key: key);

  @override
  State<Kesehatan1_MainScreen> createState() => _Kesehatan1_MainScreenState();
}

class _Kesehatan1_MainScreenState extends State<Kesehatan1_MainScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final controller = TextEditingController();

  KesehatanClass kesehatanClass = new KesehatanClass();
  late List<KesehatanObject> dataKesehatanSantri = kesehatanClass.getData();
  late int perluKeteranganItemCount =
      kesehatanClass.getItemCount(dataKesehatanSantri, false);
  late int lengkapKeternganItemCount =
      kesehatanClass.getItemCount(dataKesehatanSantri, true);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _tabController = TabController(length: 2, vsync: this);

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
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: 16, bottom: 1, left: 8, right: 8),
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
                    onChanged: searchSantri,
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
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: ListView.builder(
                      itemCount: dataKesehatanSantri.length,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, int index) {
                        return Container(
                          margin: EdgeInsets.only(top: 6),
                          child: Ink(
                            height: 160,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.blueAccent, width: 2),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blueAccent.withOpacity(0.1)),
                            child: InkWell(
                              onTap: () {
                                _showBottomSheet(
                                    context,
                                    dataKesehatanSantri[index].nama,
                                    dataKesehatanSantri[index].id);
                              },
                              onLongPress: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SudahSembuhDialog(
                                          "", dataKesehatanSantri[index].nama);
                                    }).then((value) {
                                  print(
                                      '${dataKesehatanSantri[index].nama} $value');
                                });
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(left: 8),
                                    child: ClipRRect(
                                      child: Container(
                                        height: 140.0,
                                        width: 95.0,
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
                                                onTap: () {},
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
                                      dataKesehatanSantri[index].id,
                                      style: GoogleFonts.sourceSansPro(
                                          fontSize: 14, color: Colors.black54),
                                    ),
                                    margin: EdgeInsets.only(left: 120, top: 17),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      dataKesehatanSantri[index].nama,
                                      maxLines: 2,
                                      style: GoogleFonts.raleway(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    margin: EdgeInsets.only(
                                        left: 120, top: 0, bottom: 30),
                                  ),
                                  Container(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      padding: EdgeInsets.all(0),
                                      icon: Icon(Icons.arrow_drop_down),
                                      color: Colors.black87,
                                      iconSize: 36,
                                      onPressed: () {},
                                    ),
                                    margin: EdgeInsets.only(right: 0, top: 0),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'Sakit: ......',
                                      style: GoogleFonts.sourceSansPro(
                                          fontSize: 16,
                                          color:
                                              Colors.black38.withOpacity(0.5),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    margin:
                                        EdgeInsets.only(left: 120, bottom: 45),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'Dirawat di: ......',
                                      style: GoogleFonts.sourceSansPro(
                                          fontSize: 16,
                                          color:
                                              Colors.black38.withOpacity(0.5),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    margin:
                                        EdgeInsets.only(left: 120, bottom: 20),
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
          Center(
            child: Text("It's rainy here"),
          ),
        ],
      ),
    );
  }

  void searchSantri(String query) {
    final searchResult = KesehatanClass().getData().where((element) {
      final namaSantri = element.nama.toLowerCase();
      final input = query.toLowerCase();

      return namaSantri.contains(input);
    }).toList();

    setState(() {
      dataKesehatanSantri = searchResult;
    });
  }
}

class SudahSembuhDialog extends StatelessWidget {
  final title;
  final nama;

  SudahSembuhDialog(this.title, this.nama);

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
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(4, 12, 4, 12),
                          child: Container(
                            child: Center(
                              child: Text(
                                'Masih sakit',
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

void _showBottomSheet(BuildContext context, String nama, String id) {
  bool isCheckboxChecked = false;
  TextEditingController detail1Controller = TextEditingController();
  TextEditingController detail2Controller = TextEditingController();
  String selectedValue = "";

  showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          id,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14.0,
                              color: Colors.black38),
                        ),
                        Text(
                          nama,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Inti Keluhan',
                          helperText: "mis: Demam, radang, diare",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Dirawat di",
                          helperText: "mis: Demam, radang, diare",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: "",
                  decoration: InputDecoration(
                    labelText: "Keterangan tambahan",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Sudah periksa",
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                    Checkbox(
                      value: isCheckboxChecked,
                      onChanged: (isChecked) {
                        setState(() {
                          isCheckboxChecked = isChecked!;
                        });
                      },
                    ),
                  ],
                ),
                if (isCheckboxChecked)
                  DottedBorder(
                    color: Colors.grey,
                    strokeWidth: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Suhu tubuh (°C)",
                                    suffixText: '°C',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Expanded(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Tensi (mm/Hg)",
                                    suffixText: 'mm/Hg',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            initialValue: "",
                            decoration: InputDecoration(
                              labelText: "Diagnosa",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            maxLines: 1,
                            initialValue: "",
                            decoration: InputDecoration(
                              labelText: "Preskripsi",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Add logic to save data and dismiss bottom sheet
                    Navigator.pop(context);
                  },
                  child: Text("Save"),
                ),
              ],
            ),
          ),
        );
      });
    },
  );
}

// List<DropdownMenuItem<String>> get dropdownItems {
//   List<DropdownMenuItem<String>> menuItems = [
//     DropdownMenuItem(child: Text("Asrama"), value: "USA"),
//     DropdownMenuItem(child: Text("Rumah"), value: "Canada"),
//     DropdownMenuItem(child: Text("RSUM"), value: "Brazil"),
//     DropdownMenuItem(child: Text("RS lain"), value: "England"),
//   ];
//   return menuItems;
// }
