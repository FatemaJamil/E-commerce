import 'package:flutter/material.dart';
import 'package:my_ecommerce/view/checkout/ui.dart';
import 'package:my_ecommerce/view/widget/button.dart';
import '../../controller/cart.dart';
import '../../widget/text.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List cartData = [];

  fetchData() async {
    var data = await CartGetController().getData();
    setState(() {
      cartData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(text: "Add to cart", fSize: 20),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                child: Image.asset("assets/icons/back.png"),
                radius: 20,
              )),
        ),
        actions: [
          Icon(Icons.add_shopping_cart),
          SizedBox(width: 10),
        ],
      ),
      body: ListView.builder(
        itemCount: cartData.length,
        itemBuilder: (context, index) => Card(
          color: Colors.orangeAccent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://eplay.coderangon.com/storage/${cartData[index]['image']}"),
                    ),
                  ),
                ),
                SizedBox(width: 20), // Row spacing
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "${cartData[index]['title']}",
                        color: Colors.black,
                      ),
                      CustomText(
                        text: "brand : ${cartData[index]['brand']}",
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: "BDT ${cartData[index]['price']}",
                            fSize: 16,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          CustomText(
                            text: " ${cartData[index]['total']}",
                            color: Colors.black,
                            td: TextDecoration.lineThrough,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: CustomButton(title: "Order Now", onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckoutScreen(productData: cartData)));
        }),
      ),
    );
  }
}
