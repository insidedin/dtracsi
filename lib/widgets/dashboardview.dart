import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';

dashboardView({required int value}) {
  return Container(
    width: 160,
    height: 130,
    decoration: ShapeDecoration(
      color: const Color.fromARGB(255, 235, 235, 235),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x3F000000),
          blurRadius: 4,
          offset: Offset(0, 4),
          spreadRadius: 0,
        ),
      ],
    ),
  );
}

dashboardMasuk(jumlahSurat) {
  return Container(
    width: 160,
    height: 130,
    decoration: ShapeDecoration(
      color: const Color.fromARGB(255, 235, 235, 235),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x3F000000),
          blurRadius: 4,
          offset: Offset(0, 4),
          spreadRadius: 0,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 25,
            ),
            const Icon(Icons.add_to_photos_rounded,
                size: 50, color: Color.fromARGB(255, 18, 52, 92)),
            const SizedBox(
              width: 8,
            ),
            textView(
                jumlahSurat.toString(),
                30,
                const Color.fromARGB(255, 18, 52, 92),
                FontWeight.bold,
                TextAlign.start,
                const EdgeInsets.all(0)),
          ],
        ),
        const SizedBox(height: 8),
        textView("Surat Masuk", 16, const Color.fromARGB(255, 18, 52, 92),
            FontWeight.w600, TextAlign.start, const EdgeInsets.all(0)),
      ],
    ),
  );
}

dashboardSetujui(jumlahSetuju) {
  return Container(
    width: 160,
    height: 130,
    decoration: ShapeDecoration(
      color: const Color.fromARGB(255, 235, 235, 235),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x3F000000),
          blurRadius: 4,
          offset: Offset(0, 4),
          spreadRadius: 0,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 25,
            ),
            const Icon(Icons.domain_verification_rounded,
                size: 50, color: Color.fromARGB(255, 18, 52, 92)),
            const SizedBox(
              width: 8,
            ),
            textView(
                jumlahSetuju.toString(),
                30,
                const Color.fromARGB(255, 18, 52, 92),
                FontWeight.bold,
                TextAlign.start,
                const EdgeInsets.all(0)),
          ],
        ),
        const SizedBox(height: 8),
        textView("Surat Disetujui", 16, const Color.fromARGB(255, 18, 52, 92),
            FontWeight.w600, TextAlign.start, const EdgeInsets.all(0)),
      ],
    ),
  );
}

dashboardDistribusi(jumlahDistribusi) {
  return Container(
    width: 160,
    height: 130,
    decoration: ShapeDecoration(
      color: const Color.fromARGB(255, 235, 235, 235),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x3F000000),
          blurRadius: 4,
          offset: Offset(0, 4),
          spreadRadius: 0,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 25,
            ),
            const Icon(Icons.send_time_extension_rounded,
                size: 50, color: Color.fromARGB(255, 18, 52, 92)),
            const SizedBox(
              width: 8,
            ),
            textView(
                jumlahDistribusi.toString(),
                30,
                const Color.fromARGB(255, 18, 52, 92),
                FontWeight.bold,
                TextAlign.start,
                const EdgeInsets.all(0)),
          ],
        ),
        const SizedBox(height: 8),
        textView(
            "Surat Didistribusi",
            16,
            const Color.fromARGB(255, 18, 52, 92),
            FontWeight.w600,
            TextAlign.start,
            const EdgeInsets.all(0)),
      ],
    ),
  );
}

dashboardDiproses(jumlahProses) {
  return Container(
    width: 160,
    height: 130,
    decoration: ShapeDecoration(
      color: const Color.fromARGB(255, 235, 235, 235),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x3F000000),
          blurRadius: 4,
          offset: Offset(0, 4),
          spreadRadius: 0,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 25,
            ),
            const Icon(Icons.list_alt_rounded,
                size: 50, color: Color.fromARGB(255, 18, 52, 92)),
            const SizedBox(
              width: 8,
            ),
            textView(
                jumlahProses.toString(),
                30,
                const Color.fromARGB(255, 18, 52, 92),
                FontWeight.bold,
                TextAlign.start,
                const EdgeInsets.all(0)),
          ],
        ),
        const SizedBox(height: 8),
        textView("Surat Diproses", 16, const Color.fromARGB(255, 18, 52, 92),
            FontWeight.w600, TextAlign.start, const EdgeInsets.all(0)),
      ],
    ),
  );
}

dashboardSelesai(jumlahSelesai) {
  return Container(
    width: 160,
    height: 130,
    decoration: ShapeDecoration(
      color: const Color.fromARGB(255, 235, 235, 235),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x3F000000),
          blurRadius: 4,
          offset: Offset(0, 4),
          spreadRadius: 0,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 25,
            ),
            const Icon(Icons.file_download_done,
                size: 50, color: Color.fromARGB(255, 18, 52, 92)),
            const SizedBox(
              width: 8,
            ),
            textView(
                jumlahSelesai.toString(),
                30,
                const Color.fromARGB(255, 18, 52, 92),
                FontWeight.bold,
                TextAlign.start,
                const EdgeInsets.all(0)),
          ],
        ),
        const SizedBox(height: 8),
        textView("Surat Selesai", 16, const Color.fromARGB(255, 18, 52, 92),
            FontWeight.w600, TextAlign.start, const EdgeInsets.all(0)),
      ],
    ),
  );
}

pengaturanUser(icon, pengguna, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 160,
      height: 160,
      decoration: ShapeDecoration(
        color: const Color.fromARGB(255, 235, 235, 235),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 8),
          textView(pengguna, 16, const Color.fromARGB(255, 18, 52, 92),
              FontWeight.w700, TextAlign.start, const EdgeInsets.all(0)),
        ],
      ),
    ),
  );
}

dashboardDiajukan(jumlahSurat) {
  return Container(
    width: 160,
    height: 130,
    decoration: ShapeDecoration(
      color: const Color.fromARGB(255, 235, 235, 235),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x3F000000),
          blurRadius: 4,
          offset: Offset(0, 4),
          spreadRadius: 0,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 25,
            ),
            const Icon(Icons.add_to_photos_rounded,
                size: 50, color: Color.fromARGB(255, 18, 52, 92)),
            const SizedBox(
              width: 8,
            ),
            textView(
                jumlahSurat.toString(),
                30,
                const Color.fromARGB(255, 18, 52, 92),
                FontWeight.bold,
                TextAlign.start,
                const EdgeInsets.all(0)),
          ],
        ),
        const SizedBox(height: 8),
        textView("Surat Diajukan", 16, const Color.fromARGB(255, 18, 52, 92),
            FontWeight.w600, TextAlign.start, const EdgeInsets.all(0)),
      ],
    ),
  );
}

