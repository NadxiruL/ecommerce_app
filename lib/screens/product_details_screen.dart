import 'package:ecommerce_app/providers/cart.dart';
import 'package:ecommerce_app/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/utils.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final int price;
  const ProductDetailsScreen(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.price});

  @override
  Widget build(BuildContext context) {
    // final data = ModalRoute.of(context)!.settings.arguments;
    final loadData = Provider.of<Products>(context);

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
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(title),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 5,
                  child: Container(
                    color: Colors.amber,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(8),
                    height: 50,
                    // color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title),
                        Text('\$ $price'),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_shopping_cart,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(top: 10),
                    // color: Colors.blue,
                    height: 100,
                    child: Text(description),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
