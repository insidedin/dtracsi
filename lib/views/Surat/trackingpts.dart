import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtracsi/utils/function.dart';
import 'package:dtracsi/views/AdminPage/trackingpage.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:dtracsi/widgets/progressbarview.dart';
import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';

class TrackingPts extends StatelessWidget {
  final Map<String, dynamic> suratData;
  const TrackingPts({super.key, required this.suratData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom2(
          "Proses Surat",
          () => navigationPop(context, const Tracking()),
          const EdgeInsets.only(right: 150)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textView(
                  "No. Agenda             : ${suratData['nomor_agenda']}",
                  16,
                  Colors.black,
                  FontWeight.bold,
                  TextAlign.start,
                  const EdgeInsets.all(0)),
              const SizedBox(height: 10),
              textView(
                  "Tanggal Terima   : ${suratData['tanggal_terima']}",
                  16,
                  Colors.black,
                  FontWeight.bold,
                  TextAlign.start,
                  const EdgeInsets.all(0)),
              const SizedBox(height: 10),
              textView(
                  "Perihal                       : ${suratData['perihal']}",
                  16,
                  Colors.black,
                  FontWeight.bold,
                  TextAlign.start,
                  const EdgeInsets.all(0)),
              const SizedBox(height: 10),
              textView(
                  "Tanggal Surat       : ${suratData['tanggal_surat']}",
                  16,
                  Colors.black,
                  FontWeight.bold,
                  TextAlign.start,
                  const EdgeInsets.all(0)),
              const SizedBox(height: 10),
              textView(
                  "Nomor Surat          : ${suratData['nomor_surat']}",
                  16,
                  Colors.black,
                  FontWeight.bold,
                  TextAlign.start,
                  const EdgeInsets.all(0)),
              const SizedBox(height: 10),
              textView(
                  "Asal Surat                : ${suratData['asal_surat']}",
                  16,
                  Colors.black,
                  FontWeight.bold,
                  TextAlign.start,
                  const EdgeInsets.all(0)),
              const SizedBox(height: 40),
              StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('disposisi')
                    .doc(suratData['nomor_agenda'].toString())
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return const Center(child: Text('No data available'));
                  }

                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  String status = data['status'] ?? 'diterima';

                  int currentStep = 0;
                  switch (status) {
                    case 'disetujui':
                      currentStep = 1;
                      break;
                    case 'didistribusi':
                      currentStep = 2;
                      break;
                    case 'diproses':
                      currentStep = 3;
                      break;
                    case 'selesai':
                      currentStep = 4;
                      break;
                    default:
                      currentStep = 0;
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 2.0),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 18, 52, 92),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: textView(
                            "Progress Surat  :",
                            17,
                            Colors.white,
                            FontWeight.w600,
                            TextAlign.start,
                            const EdgeInsets.all(0)),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildStepIndicator('Diterima', currentStep >= 0),
                          buildStepIndicator('Disetujui', currentStep >= 1),
                          buildStepIndicator('Distribusi', currentStep >= 2),
                          buildStepIndicator('Diproses', currentStep >= 3),
                          buildStepIndicator('Selesai', currentStep >= 4),
                        ],
                      ),
                      const SizedBox(height: 20),
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('disposisi')
                            .doc(suratData['nomor_agenda'].toString())
                            .collection('riwayat')
                            .orderBy('tanggal_disposisi')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return const Center(
                                child: Text('Data Surat Belum di Perbaruhi'));
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: snapshot.data!.docs.map((doc) {
                              Map<String, dynamic> historyData =
                                  doc.data() as Map<String, dynamic>;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textView(
                                    "Status: ${historyData['status']}",
                                    16,
                                    Colors.black,
                                    FontWeight.bold,
                                    TextAlign.start,
                                    const EdgeInsets.all(0),
                                  ),
                                  textView(
                                    "Tanggal: ${historyData['tanggal_disposisi']}",
                                    16,
                                    Colors.black,
                                    FontWeight.normal,
                                    TextAlign.start,
                                    const EdgeInsets.all(0),
                                  ),
                                  textView(
                                    "Keterangan: ${historyData['disposisi']}",
                                    16,
                                    Colors.black,
                                    FontWeight.normal,
                                    TextAlign.start,
                                    const EdgeInsets.all(0),
                                  ),
                                  textView(
                                    "Disposisi Kepada: ${historyData['assigned_to']}",
                                    16,
                                    Colors.black,
                                    FontWeight.normal,
                                    TextAlign.start,
                                    const EdgeInsets.all(0),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
