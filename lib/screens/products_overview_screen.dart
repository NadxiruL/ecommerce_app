import 'package:flutter/material.dart';
import '../widgets/products_list.dart';
import '../widgets/categories_widget.dart';
import '../widgets/search_widget.dart';

class ProductsOverviewScreen extends StatelessWidget {
  // List<Color> bgColor = [
  //   Color.fromARGB(255, 5, 155, 201),
  //   Color.fromARGB(255, 255, 255, 255)
  // ];

  ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
              CategoriesWidget(),

              // ALL PRODUCTS //
              AllProductsWidget(),

              // //
              // AllProductsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
