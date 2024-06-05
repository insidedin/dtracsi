import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtracsi/utils/function.dart';
import 'package:dtracsi/views/Admin/userpage.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditUser extends StatefulWidget {
  final DocumentSnapshot userDoc;

  const EditUser(this.userDoc, {super.key});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController timkerjaController;
  late String role;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    var userData = widget.userDoc.data() as Map<String, dynamic>;
    usernameController = TextEditingController(text: userData['username']);
    passwordController = TextEditingController(text: userData['password']);
    timkerjaController = TextEditingController(text: userData['timkerja']);
    role = userData['role'];
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      String username = usernameController.text.trim();
      String password = passwordController.text.trim();
      String timkerja = timkerjaController.text.trim();

      firestore.collection('users').doc(widget.userDoc.id).update({
        'username': username,
        'password': password,
        'timkerja': timkerja,
        'role': role,
      });

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarCustom3(
            "Edit User", () => navigationPop(context, const UserPage())),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                ////////// form username
                TextFormField(
                  controller: usernameController,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                      labelText: 'Username',
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username belum diinputkan!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                ////////// form password
                TextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                      labelText: 'Password',
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password belum diinputkan!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                ////////// form tim kerja
                TextFormField(
                  controller: timkerjaController,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                      labelText: 'Tim Kerja',
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tim Kerja belum diinputkan!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                ////////// dropdown rolebase
                DropdownButtonFormField(
                  value: role,
                  decoration: InputDecoration(
                      labelText: 'Role',
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
                  items: ['user', 'admin'].map((role) {
                    return DropdownMenuItem(
                      value: role,
                      child: Text(role),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      role = value!;
                    });
                  },
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF315A8A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: textView("Simpan", 16, Colors.white, FontWeight.bold,
                      TextAlign.start, const EdgeInsets.all(0)),
                ),
              ],
            ),
          ),
        ));
  }
}
