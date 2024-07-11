import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

fullButton(onPressed, text) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.all(
        16.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            const Color(0xFF315A8A),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onPressed,
      child: textView(text, 16, Colors.white, FontWeight.w600, TextAlign.start,
          const EdgeInsets.all(0)),
    ),
  );
}
