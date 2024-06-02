import 'package:dtracsi/utils/function.dart';
import 'package:dtracsi/views/Surat/tambahsurat.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:flutter/material.dart';

class ManSurat extends StatefulWidget {
  const ManSurat({super.key});

  @override
  State<ManSurat> createState() => _ManSuratState();
}

class _ManSuratState extends State<ManSurat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSurat(
        "Manajemen Surat",
        () => navigationPush(context, const TambahSurat()),
      ),
      backgroundColor: Colors.white,
    );
  }
}
