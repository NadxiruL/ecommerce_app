import 'package:flutter/material.dart';

import '../widgets/categories_widget.dart';
import '../widgets/products_listview.dart';
import '../widgets/search_widget.dart';

class ProductsOverviewScreen extends StatefulWidget {
  // List<Color> bgColor = [
  //   Color.fromARGB(255, 5, 155, 201),
  //   Color.fromARGB(255, 255, 255, 255)
  // ];

  ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 5, 155, 201),
              Color.fromARGB(255, 255, 255, 255)
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
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

              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                height: 50,
                // color: Colors.amber,
                // color: Colors.amberAccent,
                child: CategoriesWidget(),
              ),

              // ALL PRODUCTS //
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(12),
                height: 250,
                // color: Colors.amber,
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          'All Products',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      // color: Colors.blue,
                      height: 170,
                      child: AllProductsWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
