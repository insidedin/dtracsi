import 'package:flutter/material.dart';

dashboardView() {
  return Container(
    width: 160,
    height: 130,
    decoration: ShapeDecoration(
      color: const Color.fromARGB(255, 235, 235, 235),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x3F000000),
          blurRadius: 4,
          offset: Offset(0, 4),
          spreadRadius: 0,
        ),
      ],
    ),
  );
}

