import 'package:esantren_v1/Objects/KesehatanObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:esantren_v1/Classes/KesehatanClass.dart';

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
                              onTap: () {},
                              onLongPress: () {},
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
