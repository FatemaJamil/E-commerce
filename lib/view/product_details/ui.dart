
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_ecommerce/controller/product-details.dart';
import 'package:my_ecommerce/view/checkout/ui.dart';
import 'package:my_ecommerce/view/widget/appbar.dart';
import 'package:my_ecommerce/view/widget/text.dart';

import '../../widget/button.dart';



class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.pID});

  final int pID;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  List<String> sl = [

    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj29vKnEco9PLHVa3zypGyshqEMJaWsjk0AQ&s"
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ64uZ6QmswbOtOyhdVCxEpTrcAdrwi0hkhcA&s"
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC02FmUjs0VrH_KLkOeswoVDNwedl4-wOSow&s"

    ];
  
  Map data = {};
  List<String>imgList = [];

  fetchData()async{
    data = await GetProductDetails().getData(id: widget.pID);
    if (data.isNotEmpty){
     for (var i in data['gallery']){
       imgList.add(i);
     }
    }
    log("====Da : $data");
    setState(() {});
  }
  
  
  @override
  void initState() {
   fetchData();
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(height: 210.0,viewportFraction: .9,autoPlay: true),
            items: imgList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                         image: DecorationImage(fit: BoxFit.fill,
                             image:NetworkImage(
                                 "https://eplay.coderangon.com/public/storage/$i") ),
                      ),

                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "${data['title']}", color: Colors.black,fSize: 20,),
                CustomText(text: "${data['sku']}", color: Colors.black,),
                CustomText(text: "${data['brand']}", color: Colors.black,),
                CustomText(text: "${data['category']}", color: Colors.black,),
                CustomText(text: "${data['stock']} pcs", color: Colors.black,),


                Row(
                  children: [
                    
                    Icon(Icons.star,color: Colors.orange,),
                    Icon(Icons.star,color: Colors.orange,),
                    Icon(Icons.star,color: Colors.orange,),
                    Icon(Icons.star,color: Colors.orange,),
                    Icon(Icons.star,color: Colors.orange,),
                    SizedBox(width: 5,),
                    CustomText(text: ("${data['stock']} reviews"), color: Colors.grey,fSize: 20,),
                  ],
                ),


                Row(
                  spacing: 10,
                  children: [

                    CustomText(text: "price",color: Colors.black,),
                    CustomText(text:"${data['price']}",color: Colors.black,),
                    CustomText(text: "${data['old_price']}",td: TextDecoration.lineThrough,maxLine: 20,),
                  ],
                ),

                SizedBox(height: 10,),
               CustomText(text: "Details", color: Colors.black,),
                CustomText(text: "${data['description']}", color: Colors.black,),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(title:"Buy Now", onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (c)=>CheckoutScreen()));
                    } ),
                  ],
                )
              ],

            ),
          ),

        ],
      ),
    );
  }
}

