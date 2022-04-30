import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyStyle {
  headline(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  label(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
