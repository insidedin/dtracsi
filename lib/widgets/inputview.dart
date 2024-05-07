import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//////
inputUserController(controller, context) {
  return Positioned(
    left: 50,
    top: 410,
    child: SizedBox(
      width: MediaQuery.of(context).size.width - 90,
      height: 50,
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.search,
        textAlign: TextAlign.left,
        style: GoogleFonts.poppins(),
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person_4),
            labelText: 'Username',
            labelStyle:
                const TextStyle(color: Color.fromARGB(255, 110, 110, 110)),
            fillColor: const Color.fromARGB(255, 232, 232, 232),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 110, 110, 110),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never),
      ),
    ),
  );
}

/////////////////
inputPasswordController(controller, context) {
  return Positioned(
    left: 50,
    top: 490,
    child: SizedBox(
      width: MediaQuery.of(context).size.width - 90,
      height: 50,
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.search,
        textAlign: TextAlign.left,
        style: GoogleFonts.poppins(),
        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock),
            labelText: 'Password',
            labelStyle:
                const TextStyle(color: Color.fromARGB(255, 110, 110, 110)),
            fillColor: const Color.fromARGB(255, 232, 232, 232),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 110, 110, 110),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never),
      ),
    ),
  );
}


