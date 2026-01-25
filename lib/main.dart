import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_ecommerce/view/cart/ui.dart';
import 'package:my_ecommerce/view/profile/ui.dart';
import 'package:my_ecommerce/view/splash/ui.dart';




void main (){
  runApp(
    MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      home:MyProfile(),

    )
  );

}


