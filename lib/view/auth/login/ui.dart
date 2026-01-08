
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_ecommerce/view/home/ui.dart';
import 'package:my_ecommerce/view/product/ui.dart';
import 'package:my_ecommerce/view/widget/button.dart';
import 'package:my_ecommerce/view/widget/textfiled.dart';

import '../../../controller/auth/login.dart';
import '../../widget/text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formkey =GlobalKey<FormState>();
  final TextEditingController phoneC = TextEditingController();
  final TextEditingController passC = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey ,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: 'Welcome back !',color: Color(0xff5f5f5f),fSize: 22,),
          CustomText(text: 'Please enter your details to log in',),
          SizedBox(height: 10),



          CustomTextField
            (nameC: phoneC,

              validator: (v){
            if ( v == null || v.isEmpty){
              return "please enter you phone";
            }else{
              return null;
            }
          }, title: 'phone'),

          CustomTextField
            (nameC: passC,

              validator: (v){
                if ( v == null || v.isEmpty){
                  return "please enter you phone";
                }else{
                  return null;
                }
              }, title: 'password'),


            CustomButton(title: "Log in", onTap: ()async{


              if(_formkey.currentState!.validate()){


                var status = await LoginController.Login(phone : phoneC.text, password : passC.text);
                log("===${status}===");
                if (status ){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=> HomeScreen()));
                }



              }






          })
        ],
      ),
    );
  }
}



