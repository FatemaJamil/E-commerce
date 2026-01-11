
import 'package:flutter/material.dart';


import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import '../../../controller/auth/reg.dart';
import '../../widget/button.dart';

import '../../widget/text.dart';
import '../../widget/textfiled.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({super.key});

  @override
  State<ShippingScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ShippingScreen> {

  final _formkey =GlobalKey<FormState>();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController phoneC = TextEditingController();
  final TextEditingController streetC = TextEditingController();
  final TextEditingController UpazilaC = TextEditingController();
  final TextEditingController districC = TextEditingController();

  bool isLoading = false ;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shipping Information"),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back)),
      ),

        body:Form(
          key: _formkey ,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: 'Let’s Get Started!',color: Color(0xff5f5f5f),fSize: 22,),
                SizedBox(height: 5),
                CustomText(text: 'Shipping Information',color: Color(0xff242424),fSize: 16,fw: FontWeight.bold,),

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
                CustomTextField(nameC: streetC, validator: (v) {
                  if (v == null || v == ""){
                    return "please enter your street" ;
                  }
                  return null ;
                },
                    title: 'street'),
                CustomTextField(nameC: UpazilaC, validator: (v) {
                  if (v == null || v == ""){
                    return "please enter your Upazila" ;
                  }
                  return null ;
                },
                    title: 'aupazila'),
                CustomTextField(nameC: districC, validator: (v) {
                  if (v == null || v == ""){
                    return "please enter your district" ;
                  }
                  return null ;
                },
                    title: 'district'),


                isLoading == true ? Center(child: CircularProgressIndicator()) : CustomButton(
                    title: 'Next',onTap: ()async {
                  if(_formkey.currentState!.validate()){
                    return;
                   }

                  var a =  {

                    "name" : nameC.text,
                    "phone" : phoneC.text,
                    "email" : streetC.text,
                    "address" : UpazilaC.text,
                    "password" : districC.text,
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
          ),
    )
      );







  }
}







