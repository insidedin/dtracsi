import 'package:dtracsi/views/Login/login.dart';
import 'package:dtracsi/widgets/dashboardview.dart';
import 'package:dtracsi/widgets/textview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardPts extends StatefulWidget {
  const DashboardPts({super.key});

  @override
  State<DashboardPts> createState() => _DashboardPtsState();
}

class _DashboardPtsState extends State<DashboardPts> {
  String welcomeText = "Selamat datang, PTS LLDIKTI II";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 500,
              height: 900,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  Positioned(
                    left: -20,
                    top: -109,
                    child: Container(
                      width: 470,
                      height: 400,
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
                        ],
                      ),
                    ),
                  ),
                  ////////////
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 50.0, left: 30.0),
                        child: textView(
                            welcomeText,
                            16,
                            Colors.white,
                            FontWeight.bold,
                            TextAlign.start,
                            const EdgeInsets.all(0)),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 50.0, left: 90.0),
                        child: IconButton(
                          icon: const Icon(Icons.logout_rounded),
                          iconSize: 25,
                          color: Colors.white,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Konfirmasi"),
                                  content: const Text(
                                      "Apakah Anda yakin ingin keluar?"),
                                  actions: [
                                    TextButton(
                                      child: const Text("Batal"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text("Ya"),
                                      onPressed: () {
                                        FirebaseAuth.instance.signOut();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Login()),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  //////////
                  Positioned(
                    left: 30,
                    top: 130,
                    child: textView(
                        "Aplikasi Digital Tracking Disposisi \nLembaga Layanan Pendidikan Tinggi Wilayah II",
                        15,
                        Colors.white,
                        FontWeight.w600,
                        TextAlign.start,
                        const EdgeInsets.all(0)),
                  ),
                  ////////////
                  Positioned(
                    left: 160,
                    top: 230,
                    child: textView(
                        "DASHBOARD",
                        19,
                        Colors.white,
                        FontWeight.bold,
                        TextAlign.start,
                        const EdgeInsets.all(0)),
                  ),
                  ///////////
                  Positioned(
                    left: 35,
                    top: 315,
                    child: textView(
                        "Aktivitas Bulan ini :",
                        17,
                        const Color(0xFF315A8A),
                        FontWeight.bold,
                        TextAlign.start,
                        const EdgeInsets.all(0)),
                  ),
                  /////////////
                  Positioned(
                      left: 35,
                      top: 350,
                      child: Row(
                        children: [
                          dashboardDiajukan(1),
                          const SizedBox(width: 25),
                          dashboardDiproses(0),
                        ],
                      )),
                  /////////////
                  Positioned(
                      left: 35,
                      top: 500,
                      child: Row(
                        children: [
                          dashboardSelesai(0),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
