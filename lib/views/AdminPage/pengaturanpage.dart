import 'package:dtracsi/views/AdminPage/ptspage.dart';
import 'package:dtracsi/views/AdminPage/userpage.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:dtracsi/widgets/dashboardview.dart';
import 'package:flutter/material.dart';

class Pengaturan extends StatefulWidget {
  const Pengaturan({super.key});

  @override
  State<Pengaturan> createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarCustom(
          "Pengaturan User",
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 35.0, right: 35.0, top: 20.0),
            child: Row(
              children: [
                pengaturanUser(
                    const Icon(
                      Icons.people,
                      size: 70,
                      color: Color.fromARGB(255, 18, 52, 92),
                    ),
                    "Pegawai LLDIKTI II", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserPage()));
                }),
                const SizedBox(width: 25),
                pengaturanUser(
                    const Icon(
                      Icons.school_rounded,
                      size: 70,
                      color: Color.fromARGB(255, 18, 52, 92),
                    ),
                    "Pengguna PTS", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PtsPage()));
                }),
              ],
            )));
  }
}
