import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_ecommerce/view/auth/ui.dart';
import 'package:my_ecommerce/view/home/ui.dart';
import 'package:my_ecommerce/view/product/ui.dart';
import 'package:my_ecommerce/view/product_details/ui.dart';
import 'package:my_ecommerce/view/splash/ui.dart';



void main (){
  runApp(
    MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      home:HomeScreen()
    )
  );

}


