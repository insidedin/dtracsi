import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtracsi/views/Login/login.dart';
import 'package:dtracsi/widgets/dashboardview.dart';
import 'package:dtracsi/widgets/textview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardUser extends StatefulWidget {
  const DashboardUser({super.key});

  @override
  State<DashboardUser> createState() => _DashboardUserState();
}

class _DashboardUserState extends State<DashboardUser> {
  String welcomeText = "Selamat datang, User";

  @override
  void initState() {
    super.initState();
    fetchUserData(); // Panggil metode untuk mengambil data pengguna
  }

  void fetchUserData() async {
    // Dapatkan pengguna yang sedang login
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Dapatkan data pengguna dari Firestore berdasarkan UID
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      // Ambil nilai tim_kerja dari data pengguna
      String? timKerja = userSnapshot['timkerja'];

      if (timKerja != null) {
        // Update teks selamat datang berdasarkan tim_kerja
        setState(() {
          welcomeText = "Selamat datang, $timKerja";
        });
      }
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
                        padding: const EdgeInsets.only(top: 50.0, left: 145.0),
                        child: IconButton(
                            icon: const Icon(Icons.logout_rounded),
                            iconSize: 25,
                            color: Colors.white,
                            onPressed: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
                            })),
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
                          dashboardSetujui(1),
                          const SizedBox(width: 25),
                          dashboardDistribusi(0),
                        ],
                      )),
                  /////////////
                  Positioned(
                      left: 35,
                      top: 500,
                      child: Row(
                        children: [
                          dashboardDiproses(0),
                          const SizedBox(width: 25),
                          dashboardSelesai(1),
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
