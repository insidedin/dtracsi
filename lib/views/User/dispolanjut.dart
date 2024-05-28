import 'package:dtracsi/widgets/appbarview.dart';
import 'package:flutter/material.dart';

class DispoLanjutan extends StatefulWidget {
  const DispoLanjutan({super.key});

  @override
  State<DispoLanjutan> createState() => _DispoLanjutanState();
}

class _DispoLanjutanState extends State<DispoLanjutan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom("Disposisi Lanjutan"),
      backgroundColor: Colors.white,
    );
  }
}