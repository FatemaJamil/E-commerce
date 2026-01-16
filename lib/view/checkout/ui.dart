

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_ecommerce/view/widget/text.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.productData});

  final Map productData;


  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  Map product ={};

  getProductData()async{
    product = widget.productData;
    log("====ppp : ${product}");
    setState(() {});
  }

  @override
  void initState() {
    getProductData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("CheckOut"),
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        actions: [Icon(Icons.delete),SizedBox(width: 10,)] ,


      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Shipping Information",style: TextStyle(fontSize: 20,color: Colors.black),),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade200,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Name : Fatema Jamil"),
                        Icon(Icons.edit_note_outlined)
                      ],
                    ),
                    Text("Phone : 01720083503"),
                    Text("Address : "),
                    Text("Amount :"),
                  ],
                ),
              )
            ),

            SizedBox(height: 20),
            Card(
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image:DecorationImage(image: NetworkImage("https://eplay.coderangon.com/storage/${product['image']}"))
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    CustomText(text: "${product['title']}",color: Colors.black,),
                    CustomText(text: "Brand : ${product['brand']}",color: Colors.black,),
                    Row(

                      spacing: 10,
                      children: [
                        CustomText(text:"BDT: ${product['price']}",color: Colors.black,),
                        CustomText(text: "${product['old_price']}",td: TextDecoration.lineThrough,),
                      ],
                    )
                  ],)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
