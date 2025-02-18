import 'package:dtracsi/utils/function.dart';
import 'package:dtracsi/views/AdminPage/trackingpage.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({super.key});

  @override
  State<Notifikasi> createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCustom2(
        "Notifikasi",
        () => navigationPop(context, const Tracking()),
        const EdgeInsets.only(right: 160),
      ),
      body: Center(
          child: textView("Belum ada notifikasi", 16, Colors.grey,
              FontWeight.bold, TextAlign.center, EdgeInsets.all(0))),
    );
  }
}
