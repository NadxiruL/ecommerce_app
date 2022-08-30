import 'package:ecommerce_app/widgets/all_products.dart';
import 'package:ecommerce_app/widgets/categories_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/search_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static const routeName = '/home-page';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            //  Colors.purple,
            //  Colors.white
            Color.fromARGB(255, 5, 155, 201),
            Color.fromARGB(255, 255, 255, 255)
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              'MyCommerce',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                // SEARCH WIDGET //
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  // color: Colors.amber,
                  height: 70,
                  child: SearchWidget(),
                ),

                // CATEGORIES //
                CategoriesWidget(),

                // ALL PRODUCTS //
                AllProductsWidget(),

                //
                AllProductsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
