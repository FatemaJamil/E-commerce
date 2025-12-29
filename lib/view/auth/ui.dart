import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_ecommerce/view/auth/reg/ui.dart';
import 'package:my_ecommerce/view/widget/appbar.dart';

import '../widget/tabbar.dart';
import 'login/ui.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),

      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                TabbarWidget(
                  title: "Sign In",
                  onTap: () {
                    selected = 1;
                    setState(() {});
                  },
                  selected: selected,
                ),
                TabbarWidget(
                  title: " Sign Up ",
                  onTap: () {
                    selected = 2;
                    setState(() {});
                  },
                  selected: selected,
                ),
              ],
            ),
            SizedBox(height: 10,),

            selected == 1 ?  LoginScreen() : RegScreen()  ,
          ],
        ),
      ),
    );
  }
}
