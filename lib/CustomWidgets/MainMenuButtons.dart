import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainMenuButtons extends StatelessWidget {
  String text;
  String image_path;
  String routeTo;

  MainMenuButtons(this.text, this.image_path, this.routeTo);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeTo);
      },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.white],
              ),
              border: Border.all(color: Colors.grey),
              boxShadow: [
                BoxShadow(
                    color: Colors.black45,
                    blurRadius: 2.0,
                    spreadRadius: 0,
                    offset: Offset(0.0, 1.0))
              ],
            ),
            child: Image.asset('images/$image_path.png'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              '$text',
              style: GoogleFonts.montserrat(fontWeight: FontWeight.normal),
            ),
          )
        ],
      ),
    );
  }
}
