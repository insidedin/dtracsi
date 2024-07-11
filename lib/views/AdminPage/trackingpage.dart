import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtracsi/views/Surat/detailsurat.dart';
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

  Future<void> searchSurat() async {
    String nomorAgenda = agendaController.text.trim();
    if (nomorAgenda.isNotEmpty) {
      try {
        QuerySnapshot suratSnapshot = await FirebaseFirestore.instance
            .collection('surat')
            .where('nomor_agenda',
                isEqualTo: int.parse(
                    nomorAgenda))
            .get();

        if (suratSnapshot.docs.isNotEmpty) {
          var suratData = suratSnapshot.docs[0].data() as Map<String, dynamic>;

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailSurat(
                suratData: suratData,
              ),
            ),
          );
        } else {
          _showDialog('Surat tidak ditemukan',
              'Surat dengan nomor agenda $nomorAgenda tidak ditemukan.');
        }
      } catch (e) {
        _showDialog('Surat tidak ditemukan',
            'Surat dengan nomor agenda $nomorAgenda tidak ditemukan.');
      }
    } else {
      _showDialog('Nomor Agenda Kosong',
          'Silakan isi nomor agenda untuk mencari surat.');
    }
  }

  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
                  onPressed: searchSurat,
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
