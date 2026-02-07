import 'package:flutter/material.dart';
import 'package:my_ecommerce/view/cart/ui.dart';
import 'package:my_ecommerce/view/home/ui.dart';
import 'package:my_ecommerce/view/log%20out/ui.dart';
import 'package:my_ecommerce/view/order/ui.dart';

import '../profile/ui.dart';




class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CartScreen(),
    OrderScreen(),
    MyProfile(),
    //ProductScreen(title:   categoryList[i]['id'].toString(),),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        backgroundColor: Color(0xffF4A758),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Example Screens
class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Home Screen"));
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Cart Screen",style: TextStyle(color: Colors.black),));
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Checkout Screen"));
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Settings Screen"));
  }
}
