

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
      backgroundColor: Colors.white,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icons/profile.png",height: 100,width: 100,)

            ],
          ),

          Container(
            height: 300,
            width: 350,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFEF6EE),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      spacing: 10,
                      children: [
                        Icon(Icons.account_circle_outlined,color: Colors.grey.shade700),
                        Text("My Profle"),
                        Spacer(),
                        InkWell
                          (
                          onTap: (){},
                            child: Icon(Icons.arrow_forward_ios_outlined,size: 16,color: Colors.grey,))
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFEF6EE),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      spacing: 10,
                      children: [
                        Icon(Icons.list,color: Colors.grey.shade700),
                        Text("My Order"),
                        Spacer(),
                        InkWell
                          (
                            onTap: (){},
                            child: Icon(Icons.arrow_forward_ios_outlined,size: 16,color: Colors.grey,))
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFEF6EE),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      spacing: 10,
                      children: [
                        Icon(Icons.logout,color: Colors.grey.shade700),
                        Text("Logout"),
                        Spacer(),
                        InkWell
                          (
                            onTap: (){},
                            child: Icon(Icons.arrow_forward_ios_outlined,size: 16,color: Colors.grey,))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.red,
            ),

          )
        ],
      ),
    );
  }
}
