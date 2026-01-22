import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../auth/ui.dart';
import '../home/ui.dart';

class LogOut extends StatefulWidget {
  const LogOut({super.key});

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  void initState() {
    super.initState();
    // Optional: jei screen e automatic popup chai
    // WidgetsBinding.instance.addPostFrameCallback((_) => showMyPopup());
  }

  void showMyPopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Are you sure you want to Log Out?",
            style: TextStyle(fontSize: 15),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // popup close
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()), // Cancel -> home
                );
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                FlutterSecureStorage storage = const FlutterSecureStorage();
                await storage.deleteAll();
                Navigator.of(context).pop(); // popup close
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen()), // OK -> login
                );
                log("User logged out");
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Log Out")),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.orange,
          ),
          height: 50,
          width: 100,
          child: InkWell(
            onTap: showMyPopup,
            child: Text("Log Out"),
          ),
        ),
      ),
    );
  }
}
