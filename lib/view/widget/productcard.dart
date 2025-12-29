import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_ecommerce/controller/product.dart';
import 'package:my_ecommerce/view/widget/text.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              spacing: 10,
              children: [
                Container(
                  height: 156,
                  width: 173,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        "data:image/jpeg;base64,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",
                      ),
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
                      text: data['price'],
                      fw: FontWeight.w500,
                      fSize: 14,
                      color: Colors.black,
                    ),
                    CustomText(
                      text: data['old_title'],
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
    );
  }
}
