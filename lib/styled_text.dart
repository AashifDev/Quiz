import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  const StyledText({
    super.key,
    required this.text,
    this.fontSize = 18,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
