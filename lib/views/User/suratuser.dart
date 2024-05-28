import 'package:dtracsi/widgets/appbarview.dart';
import 'package:flutter/material.dart';

class SuratUser extends StatefulWidget {
  const SuratUser({super.key});

  @override
  State<SuratUser> createState() => _SuratUserState();
}

class _SuratUserState extends State<SuratUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom("Surat Diproses"),
      backgroundColor: Colors.white,
    );
  }
}
