import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtracsi/views/HomePage/home.dart';
import 'package:dtracsi/views/HomePage/homepts.dart';
import 'package:dtracsi/views/HomePage/homeuser.dart';
import 'package:dtracsi/views/Login/register.dart';
import 'package:dtracsi/widgets/inputview.dart';
import 'package:dtracsi/widgets/textview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  void navigateToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Register()),
    );
  }

  Future<void> login() async {
  String username = usernameController.text.trim();
  String password = passwordController.text.trim();

  try {
    // Cek di collection 'users'
    QuerySnapshot userSnapshot = await firestore
        .collection('users')
        .where('username', isEqualTo: username)
        .limit(1)
        .get();

    if (userSnapshot.docs.isNotEmpty) {
      var userDoc = userSnapshot.docs[0];
      var userData = userDoc.data() as Map<String, dynamic>;

      if (userData['password'] == password) {
        String role = userData['role'];

        if (role == 'admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        } else if (role == 'user') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeUser()),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password salah')),
        );
      }
    } else {
      // Jika tidak ditemukan di 'users', cek di collection 'pts'
      QuerySnapshot ptsSnapshot = await firestore
          .collection('pts')
          .where('username', isEqualTo: username)
          .limit(1)
          .get();

      if (ptsSnapshot.docs.isNotEmpty) {
        var ptsDoc = ptsSnapshot.docs[0];
        var ptsData = ptsDoc.data() as Map<String, dynamic>;

        if (ptsData['password'] == password) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePts()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password salah')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Username tidak ditemukan')),
        );
      }
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 500,
                height: 800,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(color: Colors.white),
                child: Stack(
                  children: [
                    Positioned(
                      left: -139,
                      top: -156,
                      child: Container(
                        width: 600,
                        height: 440,
                        decoration: const ShapeDecoration(
                            color: Color(0xFF315A8A),
                            shape: OvalBorder(),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ]),
                      ),
                    ),
                    ///////////
                    Positioned(
                      left: 30,
                      right: 30,
                      top: -450,
                      bottom: 80,
                      child: Transform.scale(
                        scale: 0.6,
                        child: Image.asset('assets/images/appbar/dtracsi.png'),
                      ),
                    ),
                    //////////
                    Positioned(
                      left: 120,
                      right: 100,
                      top: 190,
                      child: textView(
                          "Digital Tracking Disposisi",
                          15,
                          Colors.white,
                          FontWeight.bold,
                          TextAlign.start,
                          const EdgeInsets.all(0)),
                    ),
                    //////////

                    /// Mulai
                    Positioned(
                      left: 50,
                      top: 325,
                      child: textView(
                          "Selamat Datang",
                          18,
                          const Color(0xFF315A8A),
                          FontWeight.bold,
                          TextAlign.start,
                          const EdgeInsets.all(0)),
                    ),
                    //////////
                    Positioned(
                      left: 50,
                      top: 350,
                      child: textView(
                          "di Aplikasi Digital Tracking Disposisi LLDIKTI II",
                          15,
                          const Color(0xFF315A8A),
                          FontWeight.w600,
                          TextAlign.start,
                          const EdgeInsets.all(0)),
                    ),
                    //////////
                    Positioned(
                        left: 50,
                        top: 420,
                        child: inputUserController(
                            usernameController,
                            const Icon(Icons.person_2_rounded,
                                color: Color.fromARGB(255, 142, 142, 142),
                                size: 20),
                            "Username",
                            context)),
                    ///////////
                    inputPasswordController(passwordController, passwordVisible,
                        togglePasswordVisibility, context),
                    ///////////
                    Positioned(
                      left: 100,
                      top: 600,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 200,
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            onPressed: login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF315A8A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: textView(
                                "MASUK",
                                18,
                                Colors.white,
                                FontWeight.bold,
                                TextAlign.start,
                                const EdgeInsets.all(0)),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        left: 87,
                        top: 700,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              textView(
                                  "Belum memiliki akun?",
                                  14,
                                  Colors.black,
                                  FontWeight.normal,
                                  TextAlign.center,
                                  const EdgeInsets.all(0)),
                              TextButton(
                                onPressed: navigateToRegister,
                                child: textView(
                                    "Register disini",
                                    14,
                                    const Color(0xFF315A8A),
                                    FontWeight.bold,
                                    TextAlign.center,
                                    const EdgeInsets.all(0)),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
