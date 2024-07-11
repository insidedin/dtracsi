import 'dart:io';
import 'package:dtracsi/utils/function.dart';
import 'package:dtracsi/views/AdminPage/dashboardpage.dart';
import 'package:dtracsi/views/Surat/detailsurat.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isScanCompleted = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!isScanCompleted) {
        isScanCompleted = true;
        controller.pauseCamera();
        _handleScanResult(scanData);
      }
    });
  }

  void _handleScanResult(Barcode scanData) async {
    String? qrCodeData = scanData.code;

    if (qrCodeData != null) {

      // Ekstrak nomor agenda dari hasil scan
      String? nomorAgendaString = _extractNomorAgenda(qrCodeData);

      if (nomorAgendaString != null) {
        int? nomorAgenda = int.tryParse(nomorAgendaString);
        if (nomorAgenda != null) {
          // Cari data surat di Firestore
          try {
            QuerySnapshot querySnapshot = await FirebaseFirestore.instance
                .collection('surat')
                .where('nomor_agenda', isEqualTo: nomorAgenda)
                .limit(1)
                .get();

            if (querySnapshot.docs.isNotEmpty) {
              Map<String, dynamic> suratData =
                  querySnapshot.docs[0].data() as Map<String, dynamic>;
              print("Data surat ditemukan: $suratData");

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailSurat(suratData: suratData),
                ),
              ).then((_) {
                controller?.resumeCamera();
                isScanCompleted = false;
              });
            } else {
              // Jika data tidak ditemukan
              print("Data surat tidak ditemukan di Firestore");
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Data surat tidak ditemukan')),
              );
              controller?.resumeCamera();
              isScanCompleted = false;
            }
          } catch (e) {
            print("Error saat melakukan query Firestore: $e");
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Terjadi kesalahan saat mencari data surat')),
            );
            controller?.resumeCamera();
            isScanCompleted = false;
          }
        } else {
          // Jika konversi ke int gagal
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Nomor agenda tidak valid')),
          );
          controller?.resumeCamera();
          isScanCompleted = false;
        }
      } else {
        // Jika nomor agenda tidak ditemukan dalam hasil scan
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Nomor agenda tidak ditemukan dalam QR code')),
        );
        controller?.resumeCamera();
        isScanCompleted = false;
      }
    } else {
      // Jika QR code tidak valid
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('QR code tidak valid')),
      );
      controller?.resumeCamera();
      isScanCompleted = false;
    }
  }

  String? _extractNomorAgenda(String qrCodeData) {
    // Ekstrak nomor agenda dari string hasil scan QR code
    // Asumsikan format data QR code seperti: "Nomor Agenda: 1110\nTanggal Terima: ...\nPerihal: ..."
    RegExp regExp = RegExp(r'Nomor Agenda:\s*(\d+)', caseSensitive: false);
    Match? match = regExp.firstMatch(qrCodeData);
    return match?.group(1);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom2(
        "Scan Surat",
        () => navigationPop(context, const Dashboard()),
        const EdgeInsets.only(right: 150),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Center(
              child: Text('Scan QR code yang ada di lembar disposisi surat'),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
