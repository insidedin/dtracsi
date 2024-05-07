import 'package:dtracsi/utils/function.dart';
import 'package:dtracsi/views/Login/login.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    navigationReplaceDelay(context, const Login(), 5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: appBarSplash(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 50, right: 50, top: 70),
            child: Image.asset('assets/images/splash/logo.png'),
          ),
          const SizedBox(height: 100),
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: textView("Digital Tracking Disposisi", 15, Colors.black,
                FontWeight.bold, TextAlign.start, const EdgeInsets.all(0)),
          )
        ],
      ),
    );
  }
}
