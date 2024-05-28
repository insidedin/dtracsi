import 'package:dtracsi/widgets/dashboardview.dart';
import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                  Positioned(
                    left: 30,
                    top: 60,
                    child: textView(
                        "Selamat datang, Admin",
                        16,
                        Colors.white,
                        FontWeight.bold,
                        TextAlign.start,
                        const EdgeInsets.all(0)),
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
                        "Aktivitas Hari ini :",
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
                          dashboardView(150.0),
                          const SizedBox(width: 25),
                          dashboardView(150.0),
                        ],
                      )),
                  /////////////
                  Positioned(
                      left: 35,
                      top: 500,
                      child: Row(
                        children: [
                          dashboardView(150.0),
                          const SizedBox(width: 25),
                          dashboardView(150.0),
                        ],
                      )),
                  /////////////
                  dashboardView(650.0)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
