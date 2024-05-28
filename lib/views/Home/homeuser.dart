import 'package:dtracsi/views/User/dashuser.dart';
import 'package:dtracsi/views/User/suratuser.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  int currentTab = 0;
  final List<Widget> screens = [const DashboardUser(), const SuratUser()];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const DashboardUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: currentScreen),
      ///////////////
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF315A8A),
          shape: const CircleBorder(),
          child: const Icon(
            Icons.qr_code_scanner_rounded,
            color: Colors.white,
            size: 38.0,
          ),
        ),
      ),
      //////////////
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                  const SizedBox(width: 70),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const DashboardUser();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = const SuratUser();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  const SizedBox(width: 70),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
