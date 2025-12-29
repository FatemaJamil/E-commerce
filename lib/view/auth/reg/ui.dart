
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../controller/auth/reg.dart';
import '../../widget/button.dart';

import '../../widget/text.dart';
import '../../widget/textfiled.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegScreen> {

  final _formkey =GlobalKey<FormState>();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController phoneC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController addressC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  bool isLoading = false ;




  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey ,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: 'Let’s Get Started!',color: Color(0xff5f5f5f),fSize: 22,),
          CustomText(text: 'create an account',),
          SizedBox(height: 5),
          CustomText(text: 'Phone number',color: Color(0xff242424),fSize: 16,fw: FontWeight.bold,),

          CustomTextField(nameC: nameC, validator: (v) {
            if (v == null || v == ""){
              return "please enter your name" ;
            }
            return null ;
          },
              title: 'name'),

          CustomTextField(nameC: phoneC, validator: (v) {
            if (v == null || v == ""){
              return "please enter your phone" ;
            }
            return null ;
          },
              title: 'phone'),
          CustomTextField(nameC: emailC, validator: (v) {
            if (v == null || v == ""){
              return "please enter your email" ;
            }
            return null ;
          },
              title: 'email'),
          CustomTextField(nameC: addressC, validator: (v) {
            if (v == null || v == ""){
              return "please enter your address" ;
            }
            return null ;
          },
              title: 'address'),
          CustomTextField(nameC: passC, validator: (v) {
            if (v == null || v == ""){
              return "please enter your password" ;
            }
            return null ;
          },
              title: 'password'),
          
          
         isLoading == true ? Center(child: CircularProgressIndicator()) : CustomButton(title: 'Sign Up',onTap: ()async {
            // if(_formkey.currentState!.validate()){
            //   return;
            // }

            var a =  {

              "name" : nameC.text,
              "phone" : phoneC.text,
              "email" : emailC.text,
              "address" : addressC.text,
              "password" : passC.text,
            };

            isLoading = true ;
            setState(() {});
            log("====${jsonEncode(a)}");
           bool status = await RegController().createAccountFun(data: a);
           isLoading = false;
           setState(() {});

          }),




          









        ],
      ),
    );
  }
}







