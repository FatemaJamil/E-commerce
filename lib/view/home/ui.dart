import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_ecommerce/view/widget/appbar.dart';
import 'package:my_ecommerce/view/widget/text.dart';

import '../../controller/category.dart';
import '../../controller/selling-type.dart';
import '../../controller/slider.dart';
import '../widget/productcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List p = [

    {
      "id" : 1,
      "title": "Men's Classic Cotton Head Cap",
      "sku": "CAP-COT-BLK",
      "brand": "UrbanStyle",
      "price": "650",
      "old_price": "850",
      "stock": "75",
      "image": "products/PgrKShWTkVMoWefUTr0YxLWiyRRrAXbl3joQrLXe.webp",
      "rating": "4.4",
      "review_count": "89",
      "category": "Head CAP"
    }
  ];

  List sliderList=[];
  List categoryList=[];
  Map sellingData={};
  bool isLoading = true;

  fetchSliderData()async{
   sliderList =  await SliderController().getSliderData();
   fetchCategoryData();
  }

 fetchCategoryData()async{
    categoryList =  await CategoryController().getCategoryData();
    fetchSellingData();
  }

  fetchSellingData()async{
    sellingData =  await SellingTypeController().getSellingData();
    log("====${sellingData['hot-selling']}");
    isLoading = false;
    setState(() {});
  }


  @override
  void initState() {
    isLoading = true;
     fetchSliderData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: isLoading== true? Center(child: CircularProgressIndicator()): ListView(
        scrollDirection: Axis.vertical,
        children: [
          sliderList.isEmpty? SizedBox() :
          CarouselSlider(
            options: CarouselOptions(
              height: 147.0,
              viewportFraction: .9,
              autoPlay: true,
            ),
            items: sliderList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://eplay.coderangon.com/storage/${i['image']}"),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            CustomText(text: "Cateories", color: Colors.black),
            SizedBox(height: 15),
            SizedBox(
              height: 110,
              width: MediaQuery.sizeOf(context).width,
              child: ListView.builder(
                itemCount: categoryList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, i) => Stack(

                  children: [
                    Container(
                      margin: EdgeInsets.all(2),
                      height: 109,
                      width: 90,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage("https://eplay.coderangon.com/storage/${categoryList[i]['image']}"
                            )),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),

                    Positioned(
                      bottom: 30,
                      child: Container(
                        alignment: Alignment.center,
                        child: CustomText(text: "${categoryList[i]['name']} ",color: Colors.white,fw: FontWeight.w600,),
                        height: 18,
                        width: 90,
                        color: Color(0xff201E1FCF),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),


            //hot selling

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text:"Hot Selling",color: Colors.black,),
                InkWell(
                  onTap: (){

                  },
                    child: CustomText(text:"See all",color: Colors.orange,)),
              ],
            ),
            SizedBox(height: 15),
            SizedBox(
              height:260,
              width: MediaQuery.sizeOf(context).width,
              child: ListView.builder(
                itemCount: sellingData['hot-selling'].length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, i) => ProductCard(data:sellingData['hot-selling'][i]),
              ),
            ),
            SizedBox(height: 20),

            //top selling

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text:"Top Selling",color: Colors.black,),
                InkWell(
                    child: CustomText(text:"See all",color: Colors.orange,)),
              ],
            ),
            SizedBox(height: 15),
            SizedBox(
              height:260,
              width: MediaQuery.sizeOf(context).width,
              child: ListView.builder(
                itemCount:sellingData['top-selling'].length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, i) => ProductCard(data:sellingData['top-selling'][i])),
              ),


            //New arrival
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text:"New arrival",color: Colors.black,),
                InkWell(
                    child: CustomText(text:"See all",color: Colors.orange,)),
              ],
            ),
            SizedBox(height: 15),
            SizedBox(
              height:260,
              width: MediaQuery.sizeOf(context).width,
              child: ListView.builder(
                itemCount: sellingData['new-product'].length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, i) => ProductCard(data:sellingData['new-product'][i]),
              ),
            ),

          ],
        ),
      )

        ],
      ),
    );
  }
}
