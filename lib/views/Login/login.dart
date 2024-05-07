import 'package:dtracsi/widgets/inputview.dart';
import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;

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
                    inputUserController(usernameController, context),
                    ///////////
                    inputPasswordController(passwordController, context),
                    ///////////
                    Positioned(
                      left: 100,
                      top: 600,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 200,
                        height: 55,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF315A8A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: textView(
                                "MASUK",
                                15,
                                Colors.white,
                                FontWeight.bold,
                                TextAlign.start,
                                const EdgeInsets.all(0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
