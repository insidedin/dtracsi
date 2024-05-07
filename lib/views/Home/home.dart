import 'package:dtracsi/views/Surat/mjsurat.dart';
import 'package:dtracsi/views/Tracking/tracking.dart';
import 'package:dtracsi/views/User/ptuser.dart';
import 'package:dtracsi/widgets/dashboardview.dart';
import 'package:dtracsi/widgets/textview.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [
    const Home(),
    const ManSurat(),
    const Tracking(),
    const PerUser()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: PageStorage(
            bucket: bucket,
            child: Column(
              children: [
                Container(
                  width: 500,
                  height: 900,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Stack(
                    children: [
                      Positioned(
                        left: -20,
                        top: -109,
                        child: Container(
                          width: 470,
                          height: 400,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF315A8A),
                            shape: OvalBorder(),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      ////////////
                      Positioned(
                        left: 30,
                        top: 60,
                        child: textView(
                            "Selamat datang, Admin",
                            16,
                            Colors.white,
                            FontWeight.bold,
                            TextAlign.start,
                            const EdgeInsets.all(0)),
                      ),
                      //////////
                      Positioned(
                        left: 30,
                        top: 130,
                        child: textView(
                            "Aplikasi Digital Tracking Disposisi \nLembaga Layanan Pendidikan Tinggi Wilayah II",
                            15,
                            Colors.white,
                            FontWeight.w600,
                            TextAlign.start,
                            const EdgeInsets.all(0)),
                      ),
                      ////////////
                      Positioned(
                        left: 160,
                        top: 230,
                        child: textView(
                            "DASHBOARD",
                            19,
                            Colors.white,
                            FontWeight.bold,
                            TextAlign.start,
                            const EdgeInsets.all(0)),
                      ),
                      ///////////
                      Positioned(
                        left: 35,
                        top: 315,
                        child: textView(
                            "Aktivitas Hari ini :",
                            17,
                            const Color(0xFF315A8A),
                            FontWeight.bold,
                            TextAlign.start,
                            const EdgeInsets.all(0)),
                      ),
                      /////////////
                      dashboardView(350.0),
                      /////////////
                      dashboardView(500.0),
                      /////////////
                      dashboardView(650.0)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        ////////////
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.qr_code_scanner_rounded), onPressed: () {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ///////////
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const Home();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home_rounded,
                            color: currentTab == 0 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                                color: currentTab == 0
                                    ? Colors.blue
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const ManSurat();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.email_rounded,
                            color: currentTab == 1 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            "Surat",
                            style: TextStyle(
                                color: currentTab == 1
                                    ? Colors.blue
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                /////////
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const Home();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_rounded,
                            color: currentTab == 2 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            "Tracking",
                            style: TextStyle(
                                color: currentTab == 2
                                    ? Colors.blue
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = const ManSurat();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_rounded,
                            color: currentTab == 3 ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            "User",
                            style: TextStyle(
                                color: currentTab == 3
                                    ? Colors.blue
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
