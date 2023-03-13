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
      child: Material(
        child: Ink(
            width: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: inkwell),
      ),
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

class CustomButton extends StatefulWidget {
  final String text;

  const CustomButton({Key? key, required this.text}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      child: Ink(
        decoration: BoxDecoration(
          color: _isPressed ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: _isPressed ? Colors.blueAccent : Colors.grey.shade700,
            width: 2.0,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            if (_isPressed)
              Icon(
                Icons.check,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
