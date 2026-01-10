import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_ecommerce/view/widget/appbar.dart';
import '../../controller/product.dart';

import '../widget/productcard.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.title});

  final String title;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List productFinalList = [];
  List productList = [];
  bool isLoading = true;

  fetchData() async {
    log("=====${widget.title}");
    isLoading = true;
    setState(() {});
    await Future.delayed(Duration(seconds: 2));
    productFinalList = await GetProductController().getProduct(t: widget.title);
    productList = productFinalList;
    log("===${productList.length}");
    isLoading = false;
    setState(() {});
  }


  searchData({required String search}){
    log("===search ${search}===");
    productList = productFinalList.where((v)=>['title'].toString().toLowerCase().contains(search.toLowerCase())).toList();
    log("====pl: ${productList.length}");
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

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (v){
                searchData(search: v.toString());

              },
              decoration: InputDecoration(
                hintText: "Search",
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          isLoading == true
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    itemCount: productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 10,
                      childAspectRatio: .9,
                    ),
                    itemBuilder: (context, index) =>
                        ProductCard(data: productList[index]),
                  ),
              ),
        ],
      ),
    );
  }
}
