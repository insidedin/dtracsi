import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtracsi/views/AdminUse/editsurat.dart';
import 'package:dtracsi/views/Surat/detailsurat.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuratUser extends StatefulWidget {
  const SuratUser({super.key});

  @override
  State<SuratUser> createState() => _SuratUserState();
}

class _SuratUserState extends State<SuratUser> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void deleteSurat(String documentId) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF315A8A),
          title: textView(
            "Hapus Surat",
            18,
            Colors.white,
            FontWeight.bold,
            TextAlign.start,
            EdgeInsets.zero,
          ),
          content: textView(
            "Anda yakin ingin menghapus surat ini?",
            16,
            Colors.white,
            FontWeight.normal,
            TextAlign.start,
            EdgeInsets.zero,
          ),
          actions: <Widget>[
            TextButton(
              child: textView(
                "Batal",
                16,
                Colors.white,
                FontWeight.normal,
                TextAlign.start,
                EdgeInsets.zero,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: textView(
                "Hapus",
                16,
                Colors.white,
                FontWeight.bold,
                TextAlign.start,
                EdgeInsets.zero,
              ),
              onPressed: () async {
                try {
                  await firestore.collection('surat').doc(documentId).delete();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Surat berhasil dihapus')),
                  );
                } catch (e) {
                  print("Error deleting document: $e");
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Gagal menghapus surat')),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  void editSurat(Map<String, dynamic> suratData, String documentId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            EditSurat(documentId: documentId, suratData: suratData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom("Surat Diproses"),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream:
            firestore.collection('surat').orderBy('nomor_agenda').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: snapshot.data!.docs.map((doc) {
              var data = doc.data() as Map<String, dynamic>;
              return ListTile(
                contentPadding: const EdgeInsets.only(left: 25.0, right: 10.0),
                title: Text(
                  data['asal_surat'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                subtitle: Text(
                  data['perihal'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailSurat(
                        suratData: data,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
