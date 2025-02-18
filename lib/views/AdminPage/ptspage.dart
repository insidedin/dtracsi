import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtracsi/views/AdminUse/edituser.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PtsPage extends StatefulWidget {
  const PtsPage({super.key});

  @override
  State<PtsPage> createState() => _PtsPageState();
}

class _PtsPageState extends State<PtsPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void editUser(DocumentSnapshot ptsDoc) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditUser(ptsDoc)),
    );
  }

  void deleteUser(String ptsId) {
    firestore.collection('pts').doc(ptsId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(
        "Akun Pengguna PTS",
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: firestore.collection('pts').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: const EdgeInsets.only(left: 16.0),
            children: snapshot.data!.docs.map((ptsDoc) {
              var ptsData = ptsDoc.data() as Map<String, dynamic>;
              return ListTile(
                contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
                title: Text(ptsData['username'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    )),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email: ${ptsData['email']}',
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        )),
                    Text('Asal PTS: ${ptsData['asalPT']}',
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        )),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () => editUser(ptsDoc),
                        icon: const Icon(
                          Icons.edit_note_rounded,
                          color: Colors.black,
                        )),
                    IconButton(
                        onPressed: () => deleteUser(ptsDoc.id),
                        icon: const Icon(
                          Icons.delete_rounded,
                          color: Colors.redAccent,
                        ))
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
