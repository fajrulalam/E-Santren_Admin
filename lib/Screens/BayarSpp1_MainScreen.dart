import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BayarSpp1_MainScreen extends StatefulWidget {
  const BayarSpp1_MainScreen({Key? key}) : super(key: key);

  @override
  State<BayarSpp1_MainScreen> createState() => _BayarSpp1_MainScreenState();
}

class _BayarSpp1_MainScreenState extends State<BayarSpp1_MainScreen> {
  bool _isPressed = false;
  int selectedButtonIndex = 0;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pembayaran SPP Asrama'),
          leading: BackButton(
            color: Colors.grey,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              children: [
                TextField(
                  onChanged: (String query) {},
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
                          borderSide: BorderSide(width: 1, color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(width: 1.5, color: Colors.black87)),
                      iconColor: Colors.black87),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedButtonIndex = 0;
                        });
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          color: selectedButtonIndex == 0
                              ? Colors.blue.withOpacity(0.5)
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Semua",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                            if (selectedButtonIndex == 0) SizedBox(width: 5),
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
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedButtonIndex = 1;
                        });
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          color: selectedButtonIndex == 1 ||
                                  selectedButtonIndex == 0
                              ? Colors.blue.withOpacity(0.5)
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedButtonIndex = 2;
                        });
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          color: selectedButtonIndex == 2 ||
                                  selectedButtonIndex == 0
                              ? Colors.blue.withOpacity(0.5)
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ],
                ),
                SizedBox(height: 8),
                Divider(color: Colors.grey, height: 1),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: 2,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, int index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 4, top: 4),
                          child: Ink(
                            height: 120,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.redAccent, width: 2),
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.redAccent.withOpacity(0.1)),
                            child: InkWell(
                              onTap: () {},
                              onLongPress: () {},
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text(
                                            'ID',
                                            style: GoogleFonts.sourceSansPro(
                                                fontSize: 14,
                                                color: Colors.black54),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.topRight,
                                          child: Text(
                                            "LUNAS",
                                            maxLines: 2,
                                            style: GoogleFonts.raleway(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(top: 12),
                                      child: Text(
                                        "Muhammad Fajrul Alam Ulin Nuha",
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
                                            color:
                                                Colors.black38.withOpacity(0.5),
                                            fontWeight: FontWeight.normal),
                                      ),
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
        ));
  }
}
