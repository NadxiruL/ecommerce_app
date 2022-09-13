import 'dart:convert';

import 'package:ecommerce_app/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../providers/product.dart';
import '../providers/utils.dart';
import '../providers/cart.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();

  static const routeName = '/product-details';
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  Future<Cart?> addtoCart(String userId, String id, String quantity) async {
    var uri = Uri.parse('https://dummyjson.com/carts/add');
    var response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "userId": userId,
        "products": [
          {
            "id": id,
            "quantity": quantity,
          },
        ]
      }),
    );
    print(response.body);
    if (response.statusCode == 201) {
      var json = response.body;
      return cartFromJson(json);
    }
  }

  Cart? _cart;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // Provider.of<Carts>(context).addCart;
  // }

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String?;

    //find product with specific id
    final loadedProduct = Provider.of<ProductProvider>(context, listen: false)
        .findById(productId);

    final isFav = Provider.of<ProductProvider>(context);

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
          actions: [
            IconButton(
              onPressed: () {
                isFav.toggleFav();
              },
              icon: isFav.isFavorite
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
            )
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(loadedProduct.title),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 5,
                  child: Container(
                    color: Colors.amber,
                    child: Image.network(
                      loadedProduct.thumbnail,
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
                        Text(loadedProduct.title),
                        Text('\$ ${loadedProduct.price}'),
                        Text(loadedProduct.category),
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
                    child: Text(loadedProduct.description),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add_shopping_cart),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
