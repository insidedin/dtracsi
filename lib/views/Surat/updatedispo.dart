import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtracsi/widgets/inputview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateDisposisiSurat extends StatefulWidget {
  final Map<String, dynamic> suratData;

  const UpdateDisposisiSurat({
    super.key,
    required this.suratData,
  });

  @override
  UpdateDisposisiSuratState createState() => UpdateDisposisiSuratState();
}

class UpdateDisposisiSuratState extends State<UpdateDisposisiSurat> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tanggalController = TextEditingController();
  final TextEditingController _disposisiController = TextEditingController();
  final TextEditingController _assignedToController = TextEditingController();
  String _status = 'diterima';

  @override
  void dispose() {
    _tanggalController.dispose();
    _disposisiController.dispose();
    _assignedToController.dispose();
    super.dispose();
  }

  Future<void> _updateDisposisi() async {
    if (_formKey.currentState!.validate()) {
      DocumentReference docRef = FirebaseFirestore.instance
          .collection('disposisi')
          .doc(widget.suratData['nomor_agenda'].toString());

      await docRef.set({
        'status': _status,
      }, SetOptions(merge: true));

      await docRef.collection('riwayat').add({
        'tanggal_disposisi': _tanggalController.text,
        'status': _status,
        'disposisi': _disposisiController.text,
        'assigned_to': _assignedToController.text,
      });

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Update Disposisi Surat',
          style: TextStyle(
            color: const Color.fromARGB(255, 18, 52, 92),
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              inputController(_tanggalController, 'Tanggal Disposisi', context),
              const SizedBox(height: 18),
              dropdownField(
                _status,
                'Status',
                const [
                  DropdownMenuItem(value: 'diterima', child: Text('Diterima')),
                  DropdownMenuItem(
                      value: 'disetujui', child: Text('Disetujui')),
                  DropdownMenuItem(
                      value: 'didistribusi', child: Text('Didistribusi')),
                  DropdownMenuItem(value: 'diproses', child: Text('Diproses')),
                  DropdownMenuItem(value: 'selesai', child: Text('Selesai')),
                ],
                (value) {
                  setState(() {
                    _status = value!;
                  });
                },
              ),
              const SizedBox(height: 18),
              inputController(_disposisiController, 'Disposisi', context),
              const SizedBox(height: 18),
              inputController(
                  _assignedToController, 'Disposisi Kepada', context),
              const SizedBox(height: 40),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 200,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: _updateDisposisi,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Update Disposisi',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
