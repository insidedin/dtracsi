import 'package:dtracsi/utils/function.dart';
import 'package:dtracsi/views/AdminPage/dashboardpage.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:flutter/material.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom2(
          "Scan Surat", () => navigationPush(context, const Dashboard())),
      backgroundColor: Colors.white,
    );
  }
}
