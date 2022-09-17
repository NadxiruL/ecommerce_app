import 'dart:convert';

import 'package:ecommerce_app/providers/cart.dart';
import 'package:ecommerce_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../providers/product.dart';
import '../providers/utils.dart';
import '../providers/cart.dart';
import '../widgets/add_to_cart.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();

  static const routeName = '/product-details';
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final product =
        Provider.of<ApiService>(context).getSingleProducts(productId);

    final cart = Provider.of<ApiService>(context);

    return FutureBuilder(
      future: product,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
                title: Text(snapshot.data['title']),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border),
                  ),
                ],
                elevation: 0,
                backgroundColor: Colors.transparent,
                //title: Text(loadedProduct.title),
              ),
              body: Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          snapshot.data['thumbnail'],
                          errorBuilder: (context, error, stackTrace) {
                            return Text('None');
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(8),
                        height: 50,
                        // color: Colors.amber,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(snapshot.data['title']),
                            Text('\$ ${snapshot.data['price']}'),
                            Text(snapshot.data['category']),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(top: 10),
                        // color: Colors.blue,
                        height: 100,
                        child: Text(snapshot.data['description']),
                      ),
                    )
                  ],
                ),
              ),
              floatingActionButton: AddtoCart(
                iconButton: const Icon(
                  Icons.add_shopping_cart,
                ),
                onPress: () async {
                  setState(() {
                    cart.addtoCart(
                      '1',
                      snapshot.data['id'].toString(),
                      '4',
                    );
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to cart!'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
