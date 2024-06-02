import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtracsi/utils/function.dart';
import 'package:dtracsi/views/Admin/userpage.dart';
import 'package:dtracsi/widgets/appbarview.dart';
import 'package:flutter/material.dart';

class EditUser extends StatefulWidget {
  final DocumentSnapshot userDoc;

  const EditUser(this.userDoc, {super.key});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController timkerjaController;
  late String role;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    var userData = widget.userDoc.data() as Map<String, dynamic>;
    usernameController = TextEditingController(text: userData['username']);
    passwordController = TextEditingController(text: userData['password']);
    timkerjaController = TextEditingController(text: userData['timkerja']);
    role = userData['role'];
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      String username = usernameController.text.trim();
      String password = passwordController.text.trim();
      String timkerja = timkerjaController.text.trim();

      firestore.collection('users').doc(widget.userDoc.id).update({
        'username': username,
        'password': password,
        'timkerja': timkerja,
        'role': role,
      });

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom2(
          "Edit User", () => navigationPop(context, const UserPage())),
      backgroundColor: Colors.white,
      body: Padding(        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: timkerjaController,
                decoration: const InputDecoration(labelText: 'Tim Kerja'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a tim kerja';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                value: role,
                decoration: const InputDecoration(labelText: 'Role'),
                items: ['user', 'admin'].map((role) {
                  return DropdownMenuItem(
                    value: role,
                    child: Text(role),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    role = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: submit,
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      )
    );
  }
}