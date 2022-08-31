// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'profile_screen.dart';
import '../providers/utils.dart';
import 'package:provider/provider.dart';
import 'products_overview_screen.dart';
import 'package:flutter/material.dart';
import 'cart_screen.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static const routeName = '/home-page';

  List<Widget> _widgets = <Widget>[
    ProductsOverviewScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final utils = Provider.of<Utils>(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color.fromARGB(255, 5, 155, 201),
            Color.fromARGB(255, 255, 255, 255)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Center(
            child: Text('MyCommerce'),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Center(child: _widgets.elementAt(utils.selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.cyan,
          currentIndex: utils.selectedIndex,
          onTap: utils.onItemTap,
        ),
      ),
    );
  }
}
