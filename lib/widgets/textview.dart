import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

textView(String text, double fontSize, Color fontColor, FontWeight fontBold,
    TextAlign positionFont, EdgeInsets margin) {
  return Container(
    margin: margin,
    child: Text(
      text,
      textAlign: positionFont,
      style: GoogleFonts.poppins(
        color: fontColor,
        fontWeight: fontBold,
        fontSize: fontSize,
      ),
    ),
  );
}

////////////
textButtonClick(String text, fontColor, size, onTap) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(4),
      splashColor: Colors.blueGrey,
      onTap: onTap,
      child: Text(
        textAlign: TextAlign.end,
        text,
        style: GoogleFonts.poppins(
          color: fontColor,
          fontWeight: FontWeight.bold,
          fontSize: size,
        ),
      ),
    ),
  );
}