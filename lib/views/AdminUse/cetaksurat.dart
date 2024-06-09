import 'package:dtracsi/widgets/appbarview.dart';
import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:pdf/widgets.dart' as pw;

class CetakSurat extends StatelessWidget {
  final int nomorAgenda;
  final String tanggalTerima;
  final String perihal;
  final String tanggalSurat;
  final String nomorSurat;
  final String asalSurat;

  const CetakSurat({
    super.key,
    required this.nomorAgenda,
    required this.tanggalTerima,
    required this.perihal,
    required this.tanggalSurat,
    required this.nomorSurat,
    required this.asalSurat,
  });

  @override
  Widget build(BuildContext context) {
    String qrData =
        'Nomor Agenda: $nomorAgenda\nTanggal Terima: $tanggalTerima\nPerihal: $perihal\nTanggal Surat: $tanggalSurat\nNomor Surat: $nomorSurat\nAsal Surat: $asalSurat';
    ScreenshotController screenshotController = ScreenshotController();

    Future<Uint8List> generatePdf(PdfPageFormat format) async {
      final pdf = pw.Document();
      final qrImage = await screenshotController.capture();
      final templateImage =
          (await rootBundle.load('assets/template.png')).buffer.asUint8List();

      pdf.addPage(
        pw.Page(
          pageFormat: format,
          build: (context) {
            return pw.Stack(
              children: [
                pw.Positioned.fill(
                  child: pw.Image(pw.MemoryImage(templateImage),
                      fit: pw.BoxFit.cover),
                ),
                pw.Positioned(
                  top: 158,
                  left: 145,
                  child: pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('$nomorAgenda',
                          style: const pw.TextStyle(fontSize: 12)),
                      pw.SizedBox(width: 195, height: 2),
                      qrImage != null
                          ? pw.Image(
                              pw.MemoryImage(qrImage),
                              width: 80,
                              height: 80,
                            )
                          : pw.Container(),
                    ],
                  ),
                ),
                pw.Positioned(
                  top: 184,
                  left: 145,
                  child: pw.Text(tanggalTerima,
                      style: const pw.TextStyle(fontSize: 12)),
                ),
                pw.Positioned(
                  top: 248,
                  left: 145,
                  child: pw.Text(perihal, style: const pw.TextStyle(fontSize: 12)),
                ),
                pw.Positioned(
                  top: 272,
                  left: 145,
                  child: pw.Text(tanggalSurat,
                      style: const pw.TextStyle(fontSize: 12)),
                ),
                pw.Positioned(
                  top: 293,
                  left: 145,
                  child:
                      pw.Text(nomorSurat, style: const pw.TextStyle(fontSize: 12)),
                ),
                pw.Positioned(
                  top: 325,
                  left: 145,
                  child:
                      pw.Text(asalSurat, style: const pw.TextStyle(fontSize: 12)),
                ),
              ],
            );
          },
        ),
      );

      return pdf.save();
    }

    return Scaffold(
      appBar: appBarCustom(asalSurat),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Screenshot(
                controller: screenshotController,
                child: QrImageView(
                  data: qrData,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
            ),
            const SizedBox(height: 15),
            textView("Nomor Agenda   : $nomorAgenda ", 16, Colors.black,
                FontWeight.w600, TextAlign.start, const EdgeInsets.all(0)),
            const SizedBox(height: 10),
            textView("Tanggal Terima : $tanggalTerima ", 16, Colors.black,
                FontWeight.w600, TextAlign.start, const EdgeInsets.all(0)),
            const SizedBox(height: 10),
            textView("Perihal                   : $perihal ", 16, Colors.black,
                FontWeight.w600, TextAlign.start, const EdgeInsets.all(0)),
            const SizedBox(height: 10),
            textView("Tanggal Surat    : $tanggalSurat ", 16, Colors.black,
                FontWeight.w600, TextAlign.start, const EdgeInsets.all(0)),
            const SizedBox(height: 10),
            textView("Nomor Surat       : $nomorSurat ", 16, Colors.black,
                FontWeight.w600, TextAlign.start, const EdgeInsets.all(0)),
            const SizedBox(height: 10),
            textView("Asal Surat            : $asalSurat", 16, Colors.black,
                FontWeight.w600, TextAlign.start, const EdgeInsets.all(0)),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                ),
                onPressed: () async {
                  final pdfData = await generatePdf(PdfPageFormat.a4);
                  await Printing.layoutPdf(
                    onLayout: (format) => pdfData,
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.print, color: Colors.white),
                    const SizedBox(width: 8),
                    textView(
                        "Cetak Lembar Disposisi",
                        14,
                        Colors.white,
                        FontWeight.w600,
                        TextAlign.start,
                        const EdgeInsets.all(0)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Tutup'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}