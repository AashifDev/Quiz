import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;

  const StyledText(
      {super.key,
      required this.text,
      this.fontSize = 18,
      this.color = Colors.black,
      this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.lato(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
