import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//////
inputUserController(controller, context) {
  return Positioned(
    left: 50,
    top: 410,
    child: SizedBox(
      width: MediaQuery.of(context).size.width - 90,
      height: 60,
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.search,
        textAlign: TextAlign.left,
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 16,
        ),
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person_2_rounded,
                color: Color.fromARGB(255, 142, 142, 142), size: 22),
            labelText: 'Username',
            labelStyle: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 198, 198, 198),
              fontSize: 16,
            ),
            fillColor: const Color.fromARGB(255, 232, 232, 232),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never),
      ),
    ),
  );
}

/////////////////
inputPasswordController(controller, passwordVisible, setState, context) {
  return Positioned(
    left: 50,
    top: 490,
    child: SizedBox(
      width: MediaQuery.of(context).size.width - 90,
      height: 60,
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.search,
        textAlign: TextAlign.left,
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 16,
        ),
        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock,
                color: Color.fromARGB(255, 142, 142, 142), size: 20),
            suffixIcon: IconButton(
              icon: Icon(
                passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: const Color.fromARGB(255, 142, 142, 142),
                size: 22,
              ),
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
            ),
            labelText: 'Password',
            labelStyle: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 198, 198, 198),
              fontSize: 16,
            ),
            fillColor: const Color.fromARGB(255, 232, 232, 232),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never),
      ),
    ),
  );
}

/////////////////
inputController(
  controller,
  label,
  context,
) {
  return TextField(
    controller: controller,
    textInputAction: TextInputAction.next,
    textAlign: TextAlign.left,
    style: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 15,
    ),
    decoration: InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.poppins(
        color: const Color.fromARGB(255, 151, 151, 151),
        fontSize: 14,
      ),
      fillColor: const Color.fromARGB(255, 232, 232, 232),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 151, 151, 151),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

//////////////
inputtanggalController(controller, label, context) {
  return TextField(
    controller: controller,
    textInputAction: TextInputAction.next,
    textAlign: TextAlign.left,
    style: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 15,
    ),
    decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(
          color: const Color.fromARGB(255, 151, 151, 151),
          fontSize: 14,
        ),
        fillColor: const Color.fromARGB(255, 232, 232, 232),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never),
  );
}

////////
dropdownField(
  String value,
  String labelText,
  List<DropdownMenuItem<String>> items,
  ValueChanged<String?> onChanged,
) {
  return DropdownButtonFormField<String>(
    value: value,
    items: items,
    onChanged: onChanged,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: GoogleFonts.poppins(
        color: const Color.fromARGB(255, 151, 151, 151),
        fontSize: 14,
      ),
      fillColor: const Color.fromARGB(255, 232, 232, 232),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),
    ),
  );
}
