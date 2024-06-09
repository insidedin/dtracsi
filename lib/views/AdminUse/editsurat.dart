import 'package:dtracsi/utils/function.dart';
import 'package:dtracsi/views/AdminPage/suratpage.dart';
import 'package:dtracsi/views/AdminPage/userpage.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:flutter/material.dart';

class EditSurat extends StatefulWidget {
  const EditSurat({super.key});

  @override
  State<EditSurat> createState() => _EditSuratState();
}

class _EditSuratState extends State<EditSurat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom3(
            "Edit Surat", () => navigationPop(context, const ManSurat())),
        backgroundColor: Colors.white,
    );
  }
}