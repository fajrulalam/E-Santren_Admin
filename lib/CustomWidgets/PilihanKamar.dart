import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PilihanKamarButton extends StatelessWidget {
  Widget inkwell;
  Color color;

  PilihanKamarButton(this.color, this.inkwell);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 6),
      child: Ink(
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: inkwell),
    );
  }
}

class CustomInkwell extends StatelessWidget {
  String kamar;

  CustomInkwell(this.kamar);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Center(
        child: Text(kamar, style: GoogleFonts.raleway()),
      ),
    );
  }
}

// return Container(
//   margin: EdgeInsets.only(right: 6),
//   width: 80,
//   decoration: BoxDecoration(
//     // gradient: RadialGradient(
//     //   center: Alignment.center,
//     //   radius: 0.95,
//     //   colors: [Colors.white, Color(0xFFF61a6cf)],
//     // ),
//     border: Border.all(color: Colors.grey),
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(10),
//   ),
//   child: InkWell(
//     onTap: () {},
//     splashColor: const Color(0x8034b0fc),
//     child: Center(
//       child: Text(
//         kamar,
//         style:
//             GoogleFonts.raleway(fontWeight: FontWeight.bold, fontSize: 14),
//       ),
//     ),
//   ),
// );
//   }
// }
