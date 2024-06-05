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

appBarSurat(String nama, ditekan) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textView(nama, 17, const Color(0xFF315A8A), FontWeight.bold,
            TextAlign.start, const EdgeInsets.only(left: 13)),
        Padding(
          padding: const EdgeInsets.only(
              right: 3.0), // Adjust this value to move the icon to the right
          child: IconButton(
            icon: const Icon(
              Icons.add_box_rounded,
              color: Color(0xFF315A8A),
              size: 30.0,
            ),
            onPressed: ditekan,
          ),
        ),
      ],
    ),
    shape: const RoundedRectangleBorder(
      borderRadius:
          BorderRadius.only(bottomLeft: Radius.zero, bottomRight: Radius.zero),
    ),
    automaticallyImplyLeading: false,
  );
}

appBarCustom(String nama) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textView(nama, 17, const Color(0xFF315A8A), FontWeight.bold,
            TextAlign.start, const EdgeInsets.only(left: 13)),
      ],
    ),
    shape: const RoundedRectangleBorder(
      borderRadius:
          BorderRadius.only(bottomLeft: Radius.zero, bottomRight: Radius.zero),
    ),
    automaticallyImplyLeading: false,
  );
}

appBarCustom2(String nama, ditekan) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
        height: 50,
        child: IconButton(
          icon: const Icon(Icons.cancel, color: Color(0xFF315A8A), size: 27.0),
          onPressed: ditekan,
        ),
      ),
      textView(nama, 17, const Color(0xFF315A8A), FontWeight.bold,
          TextAlign.start, const EdgeInsets.only(right: 120))
    ]),
    shape: const RoundedRectangleBorder(
      borderRadius:
          BorderRadius.only(bottomLeft: Radius.zero, bottomRight: Radius.zero),
    ),
    automaticallyImplyLeading: false,
  );
}

appBarCustom3(String nama, ditekan) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
        height: 50,
        child: IconButton(
          icon: const Icon(Icons.cancel, color: Color(0xFF315A8A), size: 27.0),
          onPressed: ditekan,
        ),
      ),
      textView(nama, 17, const Color(0xFF315A8A), FontWeight.bold,
          TextAlign.start, const EdgeInsets.only(right: 160))
    ]),
    shape: const RoundedRectangleBorder(
      borderRadius:
          BorderRadius.only(bottomLeft: Radius.zero, bottomRight: Radius.zero),
    ),
    automaticallyImplyLeading: false,
  );
}
