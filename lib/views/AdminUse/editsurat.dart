import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtracsi/utils/function.dart';
import 'package:dtracsi/views/AdminPage/suratpage.dart';
import 'package:dtracsi/views/AdminPage/userpage.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditSurat extends StatefulWidget {
  final String documentId;
  final Map<String, dynamic> suratData;

  const EditSurat(
      {super.key, required this.documentId, required this.suratData});

  @override
  State<EditSurat> createState() => _EditSuratState();
}

class _EditSuratState extends State<EditSurat> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final formKey = GlobalKey<FormState>();
  late TextEditingController tanggalTerimaController;
  late TextEditingController perihalController;
  late TextEditingController tanggalSuratController;
  late TextEditingController nomorSuratController;
  late TextEditingController asalSuratController;

  @override
  void initState() {
    super.initState();
    tanggalTerimaController = TextEditingController(
        text: widget.suratData['tanggal_terima'].toString());
    perihalController =
        TextEditingController(text: widget.suratData['perihal'].toString());
    tanggalSuratController = TextEditingController(
        text: widget.suratData['tanggal_surat'].toString());
    nomorSuratController =
        TextEditingController(text: widget.suratData['nomor_surat'].toString());
    asalSuratController =
        TextEditingController(text: widget.suratData['asal_surat'].toString());
  }

  void updateSurat() async {
    if (formKey.currentState!.validate()) {
      await firestore.collection('surat').doc(widget.documentId).update({
        'tanggal_terima': tanggalTerimaController.text,
        'perihal': perihalController.text,
        'tanggal_surat': tanggalSuratController.text,
        'nomor_surat': nomorSuratController.text,
        'asal_surat': asalSuratController.text,
      });
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    tanggalTerimaController.dispose();
    perihalController.dispose();
    tanggalSuratController.dispose();
    nomorSuratController.dispose();
    asalSuratController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom3(
          "Edit Surat", () => navigationPop(context, const ManSurat())),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              ///////////
              TextFormField(
                controller: tanggalTerimaController,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  labelText: 'Tanggal Terima',
                  labelStyle: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 151, 151, 151),
                    fontSize: 15,
                  ),
                  fillColor: const Color.fromARGB(255, 232, 232, 232),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 232, 232, 232),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 151, 151, 151),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal Terima tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),
              /////////////////
              TextFormField(
                controller: perihalController,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  labelText: 'Perihal',
                  labelStyle: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 151, 151, 151),
                    fontSize: 15,
                  ),
                  fillColor: const Color.fromARGB(255, 232, 232, 232),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 232, 232, 232),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 151, 151, 151),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Perihal tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),
              ////////////
              TextFormField(
                controller: tanggalSuratController,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  labelText: 'Tanggal Surat',
                  labelStyle: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 151, 151, 151),
                    fontSize: 15,
                  ),
                  fillColor: const Color.fromARGB(255, 232, 232, 232),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 232, 232, 232),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 151, 151, 151),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal Surat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),
              ////////////////
              TextFormField(
                controller: nomorSuratController,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  labelText: 'Nomor Surat',
                  labelStyle: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 151, 151, 151),
                    fontSize: 15,
                  ),
                  fillColor: const Color.fromARGB(255, 232, 232, 232),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 232, 232, 232),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 151, 151, 151),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor Surat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),
              ////////////////
              TextFormField(
                controller: asalSuratController,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  labelText: 'Asal Surat',
                  labelStyle: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 151, 151, 151),
                    fontSize: 15,
                  ),
                  fillColor: const Color.fromARGB(255, 232, 232, 232),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 232, 232, 232),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 151, 151, 151),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Asal Surat tidak boleh kosong';
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
                    onPressed: updateSurat,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF315A8A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: textView(
                        "Update Surat",
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
      ),
    );
  }
}
