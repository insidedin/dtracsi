import 'package:dtracsi/utils/auth_service.dart';
import 'package:dtracsi/views/HomePage/home.dart';
import 'package:dtracsi/views/HomePage/homeuser.dart';
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
final AuthService _authService = AuthService();
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
  bool isLoggedIn = await _authService.getLoginStatus();
  if (isLoggedIn) {
    String? userRole = await _authService.getUserRole();
    if (userRole != null) {
      switch (userRole) {
        case 'admin':
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
          break;
        case 'user':
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeUser()),
          );
          break;
        default:
          break;
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    }
  } else {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }
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
