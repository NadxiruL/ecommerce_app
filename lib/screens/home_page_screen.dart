// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'profile_screen.dart';
import '../providers/utils.dart';
import 'package:provider/provider.dart';
import 'products_overview_screen.dart';
import 'package:flutter/material.dart';
import 'cart_screen.dart';
import '../providers/product.dart';

// enum filterOptions {
//   Favorites,
//   All,
// }

class HomePage extends StatefulWidget {
  HomePage({super.key});

  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _widgets = [];

  @override
  void initState() {
    _widgets = <Widget>[
      ProductsOverviewScreen(),
      ProfileScreen(),
    ];
    super.initState();
  }

  // var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    final utils = Provider.of<Utils>(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: color,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ));
              },
              icon: Icon(Icons.shopping_cart),
            ),
            /*  PopupMenuButton(
              onSelected: (selectedValue) {
                setState(() {
                  // if (selectedValue == filterOptions.Favorites) {
                  //   // _showOnlyFavorites = true;
                  // } else {
                  //   // _showOnlyFavorites = false;
                  // }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) {
                return [
                  PopupMenuItem(
                    child: Text('Favorites'),
                    value: '',
                  ),
                  PopupMenuItem(
                    child: Text('Show All'),
                    value: '',
                  ),
                ];
              },
            ), */
          ],
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
