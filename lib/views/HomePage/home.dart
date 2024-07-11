import 'package:dtracsi/views/AdminPage/dashboardpage.dart';
import 'package:dtracsi/views/AdminPage/suratpage.dart';
import 'package:dtracsi/views/AdminPage/trackingpage.dart';
import 'package:dtracsi/views/AdminPage/userpage.dart';
import 'package:dtracsi/views/Scanner/scanqr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [
    const Dashboard(),
    const ManSurat(),
    const Tracking(),
    const UserPage()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Dashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageStorage(bucket: bucket, child: currentScreen),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.white,
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /////////
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Dashboard();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_rounded,
                          size: 30.0,
                          color: currentTab == 0
                              ? const Color(0xFF315A8A)
                              : Colors.grey[500],
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                              color: currentTab == 0
                                  ? const Color(0xFF315A8A)
                                  : Colors.grey[500],
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  //////////
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
                          size: 30.0,
                          color: currentTab == 1
                              ? const Color(0xFF315A8A)
                              : Colors.grey[500],
                        ),
                        Text(
                          "Surat",
                          style: TextStyle(
                              color: currentTab == 1
                                  ? const Color(0xFF315A8A)
                                  : Colors.grey[500],
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.bold),
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
                        currentScreen = const Tracking();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_rounded,
                          size: 30.0,
                          color: currentTab == 2
                              ? const Color(0xFF315A8A)
                              : Colors.grey[500],
                        ),
                        Text(
                          "Tracking",
                          style: TextStyle(
                              color: currentTab == 2
                                  ? const Color(0xFF315A8A)
                                  : Colors.grey[500],
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const UserPage();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_sharp,
                          size: 30.0,
                          color: currentTab == 3
                              ? const Color(0xFF315A8A)
                              : Colors.grey[500],
                        ),
                        Text(
                          "User",
                          style: TextStyle(
                              color: currentTab == 3
                                  ? const Color(0xFF315A8A)
                                  : Colors.grey[500],
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      ////////////
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Scan()),
            );
          },
          backgroundColor: const Color(0xFF315A8A),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.qr_code_scanner_rounded,
            color: Colors.white,
            size: 38.0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
