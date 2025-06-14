import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtracsi/utils/function.dart';
import 'package:dtracsi/views/AdminUse/cetaksurat.dart';
import 'package:dtracsi/views/AdminUse/editsurat.dart';
import 'package:dtracsi/views/AdminUse/tambahsurat.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManSurat extends StatefulWidget {
  const ManSurat({super.key});

  @override
  State<ManSurat> createState() => _ManSuratState();
}

class _ManSuratState extends State<ManSurat> {
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
      appBar: appBarSurat(
        "Manajemen Surat",
        () => navigationPush(context, const TambahSurat()),
      ),
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
                trailing: PopupMenuButton<String>(
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'edit',
                      child: ListTile(
                        leading: const Icon(Icons.edit_document),
                        title: textView(
                          "Edit",
                          14,
                          Colors.black,
                          FontWeight.w500,
                          TextAlign.start,
                          const EdgeInsets.all(0),
                        ),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'delete',
                      child: ListTile(
                        leading: const Icon(Icons.delete_forever_rounded),
                        title: textView(
                          "Hapus",
                          14,
                          Colors.black,
                          FontWeight.w500,
                          TextAlign.start,
                          const EdgeInsets.all(0),
                        ),
                      ),
                    ),
                  ],
                  onSelected: (String value) {
                    if (value == 'edit') {
                      editSurat(data, doc.id);
                    } else if (value == 'delete') {
                      deleteSurat(doc.id);
                    }
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CetakSurat(
                        nomorAgenda: data['nomor_agenda'],
                        tanggalTerima: data['tanggal_terima'],
                        perihal: data['perihal'],
                        tanggalSurat: data['tanggal_surat'],
                        nomorSurat: data['nomor_surat'],
                        asalSurat: data['asal_surat'],
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
