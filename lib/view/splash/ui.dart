
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_ecommerce/view/auth/ui.dart';
import 'package:my_ecommerce/view/home/ui.dart';
import 'package:my_ecommerce/view/product/ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  autoNavigate()async{

    FlutterSecureStorage storage= FlutterSecureStorage();
    var t = await storage.read(key: "token");
    log("==T : $t==");
    if(t==null){
      Navigator.push(context, MaterialPageRoute(builder: (c)=>AuthScreen()));
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (c)=>HomeScreen()));

    }


  }


  @override
  void initState() {
    autoNavigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/logo.jpg"),
      ),
    );
  }
}
