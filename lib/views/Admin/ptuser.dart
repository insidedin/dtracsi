import 'package:dtracsi/utils/function.dart';
import 'package:dtracsi/views/Admin/tambahuser.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:flutter/material.dart';

class PerUser extends StatefulWidget {
  const PerUser({super.key});

  @override
  State<PerUser> createState() => _PerUserState();
}

class _PerUserState extends State<PerUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSurat(
        "Pengaturan User",
        () => navigationPop(context, const TambahUser()),
      ),
      backgroundColor: Colors.white,
    );
  }
}
