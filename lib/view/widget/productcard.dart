import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_ecommerce/controller/product.dart';
import 'package:my_ecommerce/view/product_details/ui.dart';
import 'package:my_ecommerce/view/widget/text.dart';
class ProductCard extends StatelessWidget {
  const ProductCard({super.key, this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    log(" ==https://eplay.coderangon.com/storage/${data['image']}====");
    return InkWell(
      onTap: (){
        log("==Id :${data['id']}==");
        Navigator.push(context, MaterialPageRoute(builder: (c)=>ProductDetails(pID: data['id'],)));
      },
      child: Stack(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                spacing: 10,
                children: [
                  Container(
                    height: 135,
                    width: 173,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          "https://eplay.coderangon.com/public/storage/${data['image']}",
                        )

                      ),
                    ),
                  ),
                  CustomText(
                    text: data['title'],
                    fw: FontWeight.w500,
                    fSize: 12,
                    color: Colors.black,
                    maxLine: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 10,
                    children: [
                      CustomText(
                        text: "${data['price']}",
                        fw: FontWeight.w500,
                        fSize: 14,
                        color: Colors.black,
                      ),
                      CustomText(
                        text: "${data['old_price']}",
                        fw: FontWeight.w500,
                        fSize: 14,
                        td: TextDecoration.lineThrough,
                      ),
                    ],
                  ),

                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey),
                      ),
                      alignment: Alignment.center,
                      child: CustomText(
                        text: "Add to Cart",
                        fSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(left: 25, child: Image.asset("assets/icons/offer.png")),
        ],
      ),
    );
  }
}
