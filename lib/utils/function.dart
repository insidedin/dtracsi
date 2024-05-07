import 'dart:async';
import 'package:flutter/material.dart';

focusAdd(FocusNode foc, TextEditingController controller) {
  foc.addListener(() => !foc.hasFocus ? controller.clear() : null);
}

focusReq(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

navigationReplaceDelay(BuildContext context, Widget widget, int time) async {
  Timer(Duration(seconds: time), () {
    focusReq(context);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget));
  });
}

navigationPush(BuildContext context, toPage) {
  focusReq(context);
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => toPage),
  );
}