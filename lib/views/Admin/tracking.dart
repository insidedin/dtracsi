import 'package:dtracsi/widgets/appbarview.dart';
import 'package:dtracsi/widgets/inputview.dart';
import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';

class Tracking extends StatefulWidget {
  const Tracking({super.key});

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  TextEditingController agendaController = TextEditingController();
  TextEditingController asalController = TextEditingController();
  TextEditingController tanggalterimaController = TextEditingController();
  TextEditingController perihalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom("Tracking Surat"),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            inputController(agendaController, "No. Agenda", context),
            const SizedBox(height: 18),
            inputController(asalController, "Asal Surat", context),
            const SizedBox(height: 18),
            inputController(
                tanggalterimaController, "Tanggal Terima Surat", context),
            const SizedBox(height: 18),
            inputController(perihalController, "Perihal Surat", context),
            const SizedBox(height: 40),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 200,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF315A8A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: textView(
                      "CARI SURAT",
                      16,
                      Colors.white,
                      FontWeight.bold,
                      TextAlign.start,
                      const EdgeInsets.all(0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
