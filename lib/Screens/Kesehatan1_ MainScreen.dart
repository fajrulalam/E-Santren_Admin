import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Kesehatan1_MainScreen extends StatefulWidget {
  const Kesehatan1_MainScreen({Key? key}) : super(key: key);

  @override
  State<Kesehatan1_MainScreen> createState() => _Kesehatan1_MainScreenState();
}

class _Kesehatan1_MainScreenState extends State<Kesehatan1_MainScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

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
          Center(
            child: Text("It's cloudy here"),
          ),
          Center(
            child: Text("It's rainy here"),
          ),
        ],
      ),
    );
  }
}
