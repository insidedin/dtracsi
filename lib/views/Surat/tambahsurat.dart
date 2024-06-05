import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtracsi/utils/function.dart';
import 'package:dtracsi/views/Admin/suratpage.dart';
import 'package:dtracsi/views/Surat/cetaksurat.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:dtracsi/widgets/inputview.dart';
import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';

class TambahSurat extends StatefulWidget {
  const TambahSurat({super.key});

  @override
  State<TambahSurat> createState() => _TambahSuratState();
}

class _TambahSuratState extends State<TambahSurat> {
  final _formKey = GlobalKey(FormState)();
  final TextEditingController tanggalterimaController = TextEditingController();
  final TextEditingController perihalController = TextEditingController();
  final TextEditingController tanggalsuratController = TextEditingController();
  final TextEditingController nomorsuratController = TextEditingController();
  final TextEditingController asalsuratController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  int nomorAgenda = 1110; //// No agenda awal

  Future<void> _getLastNomorAgenda() async {
    QuerySnapshot snapshot = await firestore.collection('surat').orderBy('nomor_agenda', descending: true).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      nomorAgenda = snapshot.docs.first['nomor_agenda'] + 1;
    }
  }

  @override
  void initState() {
    super.initState();
    _getLastNomorAgenda();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      String tanggalTerima = tanggalterimaController.text.trim();
      String perihal = perihalController.text.trim();
      String tanggalSurat = tanggalsuratController.text.trim();
      String nomorSurat = nomorsuratController.text.trim();
      String asalSurat = asalsuratController.text.trim();

      await firestore.collection('surat').doc(nomorAgenda.toString()).set({
        'nomor_agenda': nomorAgenda,
        'tanggal_terima': tanggalTerima,
        'perihal': perihal,
        'tanggal_surat': tanggalSurat,
        'nomor_surat': nomorSurat,
        'asal_surat': asalSurat,
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CetakSurat(
            nomorAgenda: nomorAgenda,
            tanggalTerima: tanggalTerima,
            perihal: perihal,
            tanggalSurat: tanggalSurat,
            nomorSurat: nomorSurat,
            asalSurat: asalSurat,
          ),
        ),
      );

      setState(() {
        nomorAgenda++;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom2(
          "Tambah Surat Masuk", () => navigationPop(context, const ManSurat())),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            inputController(
                tanggalterimaController, "Tanggal Terima Surat", context),
            const SizedBox(height: 18),
            inputController(perihalController, "Perihal Surat", context),
            const SizedBox(height: 18),
            inputController(tanggalsuratController, "Tanggal Surat", context),
            const SizedBox(height: 18),
            inputController(nomorsuratController, "Nomor Surat", context),
            const SizedBox(height: 18),
            inputController(asalsuratController, "Asal Surat", context),
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
                  child: textView("Simpan", 16, Colors.white, FontWeight.bold,
                      TextAlign.start, const EdgeInsets.all(0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
