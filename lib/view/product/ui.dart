import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_ecommerce/view/widget/appbar.dart';
import 'package:my_ecommerce/view/widget/text.dart';import '../../controller/product.dart';


import '../widget/productcard.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  List productList= [];
  bool isLoading = true ;

  fetchData()async{
    isLoading = true ;
    setState(() {});
    await Future.delayed(Duration(seconds: 2));
    productList= await GetProductController().getProduct();
    log("===${productList.length}");
    isLoading = false;
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
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: isLoading == true? Center(child: CircularProgressIndicator()): GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        itemCount: productList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 10,
          childAspectRatio: .9,
        ),
        itemBuilder: (context, index) => ProductCard(data: productList[index]),
      ),
    );
  }
}


