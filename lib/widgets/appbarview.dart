import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';

appBarSplash() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          margin: const EdgeInsets.only(
            top: 10,
          ),
          child: Image.asset('assets/images/appbar/wuri.png'),
        ),
        Row(
          children: [
            textView(
                ' LLDIKTI \n Wilayah II',
                17,
                Colors.black,
                FontWeight.bold,
                TextAlign.start,
                const EdgeInsets.only(top: 10)),
          ],
        )
      ],
    ),
    automaticallyImplyLeading: false,
  );
}
