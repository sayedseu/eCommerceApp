import 'package:ecommerce_app/resources/colors.dart';
import 'package:ecommerce_app/resources/strings.dart';
import 'package:ecommerce_app/view/profile/profile.dart';
import 'package:flutter/material.dart';

import 'cart/cart.dart';
import 'category/category.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    CategoryPage(),
    CartPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: AppStrings.category,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: AppStrings.cart,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: AppStrings.profile,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorManager.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}
