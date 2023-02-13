import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:esantren_v1/CustomWidgets/MainMenuButtons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String username = "Mundzir ";

  Color gradient2 = Color(0xFF80F1D8);
  Color gradient1 = Color(0xFF65EC65);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("eSantren"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 80,
            padding: EdgeInsets.all(20),
            child: Stack(
              children: [
                Container(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(TextSpan(
                      text: "Assalamu'alaikum, ",
                      children: [
                        TextSpan(
                            text: "$username!",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                      style: GoogleFonts.workSans(
                          fontSize: 24, fontWeight: FontWeight.w400))),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Card(
              color: Colors.grey[100],
              elevation: 2,
              margin: EdgeInsets.all(20),
              child: Stack(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Text(
                            'Berfikir cepat, Berdzikir kuat, \nBertindak tepat.',
                            style: GoogleFonts.raleway(
                                height: 1.5,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0, top: 8),
                          child: Text(
                            "KH. As'ad Umar",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.raleway(
                                height: 1.5, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/hello_santri.png'),
                              alignment: Alignment.bottomRight)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MainMenuButtons('Absensi', 'absensi', '/absensi'),
                        MainMenuButtons('Mengaji', 'ngaji', '/'),
                        MainMenuButtons('Bayar SPP', 'bayar-spp', '/'),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MainMenuButtons('Pulang', 'izin-pulang', '/'),
                        MainMenuButtons('Kesehatan', 'data-kesehatan', '/'),
                        Container(
                          width: 70,
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    child: Container(),
                    flex: 1,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: "Aktivitas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Pengaturan Akun",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 2,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
