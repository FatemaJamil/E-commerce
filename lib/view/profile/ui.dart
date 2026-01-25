

import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                child: Image.asset("assets/icons/back.png"),
                radius: 20,
              )),
        ),

      ),
      body: Column(
        children: [
          Row(
            children: [
              Image.asset("assets/icons/profile.png")
            ],
          )
        ],
      ),
    );
  }
}
