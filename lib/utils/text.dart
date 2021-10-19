import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedText extends StatelessWidget {
  final String? text;

  final Color? colour;

  final double? size;

  ModifiedText({this.text, this.colour, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.breeSerif(color: colour, fontSize: size),
    );
  }
}
