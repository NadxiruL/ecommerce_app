import 'package:flutter/material.dart';
import '../providers/product.dart';
import '../providers/utils.dart';
import '../widgets/categories_widget.dart';
import '../widgets/products_list.dart';
import '../widgets/search_widget.dart';
import 'package:provider/provider.dart';

class ProductsOverviewScreen extends StatefulWidget {
  // List<Color> bgColor = [
  //   Color.fromARGB(255, 5, 155, 201),
  //   Color.fromARGB(255, 255, 255, 255)
  // ];

  const ProductsOverviewScreen(bool showOnlyFavorites, {super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  @override
  Widget build(BuildContext context) {
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
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // SEARCH WIDGET //
              Container(
                margin: const EdgeInsets.only(top: 20),
                // color: Colors.amber,
                height: 70,
                child: const SearchWidget(),
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
                height: 60,
                // color: Colors.amber,
                // color: Colors.amberAccent,
                child: const Categories(),
              ),

              // ALL PRODUCTS //
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(12),
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
                      margin: const EdgeInsets.only(top: 10),
                      // color: Colors.blue,
                      height: 170,
                      child: const ProductList(),
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
