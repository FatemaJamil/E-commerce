import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_ecommerce/view/bottom_navigation/ui.dart';
import 'package:my_ecommerce/view/cart/ui.dart';
import 'package:my_ecommerce/view/checkout/ui.dart';
import 'package:my_ecommerce/view/home/ui.dart';
import 'package:my_ecommerce/view/nav/ui.dart';
import 'package:my_ecommerce/view/shipping/ui.dart';
import 'package:my_ecommerce/view/splash/ui.dart';




void main (){
  runApp(
    MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),

    )
  );

}


