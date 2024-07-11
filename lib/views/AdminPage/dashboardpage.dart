import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtracsi/utils/auth_service.dart';
import 'package:dtracsi/views/Login/login.dart';
import 'package:dtracsi/widgets/dashboardview.dart';
import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final AuthService _authService = AuthService();

  Future<Map<String, int>> getCounts() async {
    final firestore = FirebaseFirestore.instance;

    final snapshot = await firestore.collection('disposisi').get();
    final docs = snapshot.docs;

    Map<String, int> counts = {
      'diterima': 0,
      'disetujui': 0,
      'didistribusi': 0,
      'diproses': 0,
      'selesai': 0,
    };

    for (var doc in docs) {
      final status = doc.data()['status'] as String?;
      if (status != null && counts.containsKey(status)) {
        counts[status] = counts[status]! + 1;
      }
    }

    return counts;
  }

  void logout() async {
    await _authService.logout();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
      (Route<dynamic> route) => false,
    );
  }

  void confirmLogout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi Logout"),
          content: const Text("Apakah Anda yakin ingin logout dari akun ini?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                logout();
              },
              child: const Text("Ya, Logout"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<Map<String, int>>(
        future: getCounts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            final counts = snapshot.data!;
            return SingleChildScrollView(
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
                        Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 50.0, left: 30.0),
                              child: textView(
                                  "Selamat datang, Admin",
                                  16,
                                  Colors.white,
                                  FontWeight.bold,
                                  TextAlign.start,
                                  const EdgeInsets.all(0)),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 50.0, left: 145.0),
                              child: IconButton(
                                  icon: const Icon(Icons.logout_rounded),
                                  iconSize: 25,
                                  color: Colors.white,
                                  onPressed: confirmLogout),
                            ),
                          ],
                        ),
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
                        Positioned(
                            left: 35,
                            top: 350,
                            child: Row(
                              children: [
                                dashboardMasuk(counts['diterima']!),
                                const SizedBox(width: 25),
                                dashboardSetujui(counts['disetujui']!),
                              ],
                            )),
                        Positioned(
                            left: 35,
                            top: 500,
                            child: Row(
                              children: [
                                dashboardDistribusi(counts['didistribusi']!),
                                const SizedBox(width: 25),
                                dashboardDiproses(counts['diproses']!),
                              ],
                            )),
                        Positioned(
                            left: 35,
                            top: 650,
                            child: Row(
                              children: [
                                dashboardSelesai(counts['selesai']!),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
