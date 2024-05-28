import 'package:dtracsi/utils/function.dart';
import 'package:dtracsi/views/Admin/mjsurat.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:flutter/material.dart';

class TambahUser extends StatefulWidget {
  const TambahUser({super.key});

  @override
  State<TambahUser> createState() => _TambahUserState();
}

class _TambahUserState extends State<TambahUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom2(
          "Tambah User Baru", () => navigationPop(context, const ManSurat())),
      backgroundColor: Colors.white,
    );
  }
}
