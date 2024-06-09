import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtracsi/utils/function.dart';
import 'package:dtracsi/views/AdminPage/suratpage.dart';
import 'package:dtracsi/views/AdminUse/cetaksurat.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TambahSurat extends StatefulWidget {
  const TambahSurat({super.key});

  @override
  State<TambahSurat> createState() => _TambahSuratState();
}

class _TambahSuratState extends State<TambahSurat> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController tanggalterimaController = TextEditingController();
  final TextEditingController perihalController = TextEditingController();
  final TextEditingController tanggalsuratController = TextEditingController();
  final TextEditingController nomorsuratController = TextEditingController();
  final TextEditingController asalsuratController = TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  int nomorAgenda = 1110; //// No agenda awal

  Future<void> _getLastNomorAgenda() async {
    QuerySnapshot snapshot = await firestore
        .collection('surat')
        .orderBy('nomor_agenda', descending: true)
        .limit(1)
        .get();
    if (snapshot.docs.isNotEmpty) {
      nomorAgenda = snapshot.docs.first['nomor_agenda'] + 1;
    }
  }

  @override
  void initState() {
    super.initState();
    _getLastNomorAgenda();
  }

  void submit() async {
    if (formKey.currentState!.validate()) {
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
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 18),
                ////////// form tanggal terima
                TextFormField(
                  controller: tanggalterimaController,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                      labelText: 'Tanggal Terima',
                      labelStyle: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 151, 151, 151),
                        fontSize: 14,
                      ),
                      fillColor: const Color.fromARGB(255, 232, 232, 232),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Inputkan Tanggal Terima!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                ////////// form perihal surat
                TextFormField(
                  controller: perihalController,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                      labelText: 'Perihal',
                      labelStyle: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 151, 151, 151),
                        fontSize: 14,
                      ),
                      fillColor: const Color.fromARGB(255, 232, 232, 232),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Inputkan Perihal!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                ////////// form tanggal surat
                TextFormField(
                  controller: tanggalsuratController,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                      labelText: 'Tanggal Surat',
                      labelStyle: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 151, 151, 151),
                        fontSize: 14,
                      ),
                      fillColor: const Color.fromARGB(255, 232, 232, 232),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Inputkan Tanggal Surat!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                ////////// form nomor surat
                TextFormField(
                  controller: nomorsuratController,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                      labelText: 'Nomor Surat',
                      labelStyle: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 151, 151, 151),
                        fontSize: 14,
                      ),
                      fillColor: const Color.fromARGB(255, 232, 232, 232),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Inputkan Nomor Surat!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18),
                ////////// form asal surat
                TextFormField(
                  controller: asalsuratController,
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                      labelText: 'Asal Surat',
                      labelStyle: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 151, 151, 151),
                        fontSize: 14,
                      ),
                      fillColor: const Color.fromARGB(255, 232, 232, 232),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Inputkan Asal!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 200,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF315A8A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: textView(
                          "Simpan",
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
          )),
    );
  }
}
