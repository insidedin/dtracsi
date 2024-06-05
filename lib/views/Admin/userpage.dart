import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtracsi/utils/function.dart';
import 'package:dtracsi/views/Admin/edituser.dart';
import 'package:dtracsi/views/Admin/tambahuser.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void editUser(DocumentSnapshot userDoc) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditUser(userDoc)),
    );
  }

  void deleteUser(String userId) {
    firestore.collection('users').doc(userId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSurat(
        "Pengaturan User",
        () => navigationPush(context, const TambahUser()),
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: firestore.collection('users').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            padding: const EdgeInsets.only(left: 16.0),
            children: snapshot.data!.docs.map((userDoc) {
              var userData = userDoc.data() as Map<String, dynamic>;
              return ListTile(
                contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
                title: Text(userData['username'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    )),
                subtitle: Wrap(
                  children: [
                    Container(
                        padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 2.0),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 100, 156, 220),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Text(userData['role'],
                            style: TextStyle(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ))),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () => editUser(userDoc),
                        icon: const Icon(
                          Icons.edit_note_rounded,
                          color: Colors.black,
                        )),
                    IconButton(
                        onPressed: () => deleteUser(userDoc.id),
                        icon: const Icon(
                          Icons.delete_rounded,
                          color: Colors.redAccent,
                        ))
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
