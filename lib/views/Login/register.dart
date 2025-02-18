import 'package:dtracsi/views/Login/login.dart';
import 'package:dtracsi/widgets/inputview.dart';
import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ptsController = TextEditingController();
  bool passwordVisible = false;

  Future<void> registerPTS() async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String email = emailController.text.trim();
  String username = usernameController.text.trim();
  String password = passwordController.text.trim();
  String asalPT = ptsController.text.trim();

  // Validasi dasar
  if (email.isEmpty || username.isEmpty || password.isEmpty || asalPT.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Semua field harus diisi')),
    );
    return;
  }

  try {
    // Cek apakah email sudah terdaftar
    var emailCheck = await firestore.collection('pts').where('email', isEqualTo: email).get();
    if (emailCheck.docs.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email sudah terdaftar')),
      );
      return;
    }

    // Tambahkan data ke Firestore
    await firestore.collection('pts').add({
      'email': email,
      'username': username,
      'password': password, // Ingat: ini tidak aman untuk produksi
      'asalPT': asalPT,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registrasi berhasil')),
    );

    // Bersihkan form dan navigasi
    emailController.clear();
    usernameController.clear();
    passwordController.clear();
    ptsController.clear();
    navigateToLogin();
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
  }
}
  void togglePasswordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  void navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    ptsController.dispose();
    super.dispose();
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
                      left: -50,
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
                      top: 310,
                      child: textView(
                          "Register Akun DTRACSI",
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
                        child: inputUserController(
                            emailController,
                            const Icon(Icons.email_rounded,
                                color: Color.fromARGB(255, 142, 142, 142),
                                size: 20),
                            "Email",
                            context)),
                    ///////////
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
                        left: 50,
                        top: 563,
                        child: inputUserController(
                            ptsController,
                            const Icon(Icons.school_rounded,
                                color: Color.fromARGB(255, 142, 142, 142),
                                size: 20),
                            "Asal Perguruan Tinggi",
                            context)),
                    ///////////
                    Positioned(
                      left: 100,
                      top: 657,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 200,
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            onPressed: registerPTS, // Ubah ini
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF315A8A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: textView(
                                "REGISTER",
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
                        left: 100,
                        top: 740,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              textView(
                                  "Sudah punya akun?",
                                  14,
                                  Colors.black,
                                  FontWeight.normal,
                                  TextAlign.center,
                                  const EdgeInsets.all(0)),
                              TextButton(
                                onPressed: navigateToLogin,
                                child: textView(
                                    "Masuk disini",
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
