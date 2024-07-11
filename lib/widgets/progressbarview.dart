import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';

buildStepIndicator(String title, bool isActive) {
  return Column(
    children: [
      Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Colors.green : Colors.grey,
        ),
        child: Center(
          child: Text(
            (isActive ? '\u2713' : ''),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ),
      ),
      const SizedBox(height: 8),
      textView(title, 12, Colors.black, FontWeight.w600, TextAlign.start,
          const EdgeInsets.all(0)),
    ],
  );
}
