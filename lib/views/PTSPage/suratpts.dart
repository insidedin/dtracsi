import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtracsi/utils/function.dart';
import 'package:dtracsi/views/PTSPage/notif.dart';
import 'package:dtracsi/views/Surat/trackingpts.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuratPts extends StatefulWidget {
  const SuratPts({super.key});

  @override
  State<SuratPts> createState() => _SuratPtsState();
}

class _SuratPtsState extends State<SuratPts> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarNotif(() => navigationPush(context, const Notifikasi())),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: firestore
            .collection('surat')
            .where('nomor_agenda', isEqualTo: 1111)
            .snapshots(),
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
                        builder: (context) => TrackingPts(suratData: data)),
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
