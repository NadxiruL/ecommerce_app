import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../providers/cart.dart';
import '../providers/product.dart';

class ApiService with ChangeNotifier {
  var data = [];
  List? filteredProducts;
  Products? allproducts;
  String searchText = '';

  Future<Products?> fetchAll() async {
    var uri = Uri.parse('https://dummyjson.com/products/');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final String allProducts = response.body;
      //  print(categories);
      // return productsFromJson(allProducts);
      return productsFromJson(allProducts);
    }
  }

  Future getCategories() async {
    var uri = Uri.parse('https://dummyjson.com/products/categories');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final String categories = response.body;
      //  print(categories);
      return json.decode(categories);
    }
  }

  Future getProductsCategory(String categoryName) async {
    var uri =
        Uri.parse('https://dummyjson.com/products/category/$categoryName');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final String categoryName = response.body;
      //  print(categoryName);
      return json.decode(categoryName);
    }
  }

  Future getSingleProducts(String id) async {
    var uri = Uri.parse('https://dummyjson.com/products/$id');
    final respose = await http.get(uri);

    if (respose.statusCode == 200) {
      final String singleProduct = respose.body;
      //  print(singleProduct);
      return json.decode(singleProduct);
    }
  }

  Future searchProducts(String keyword) async {
    allproducts = (await ApiService().fetchAll());
    filteredProducts = allproducts?.products.where((element) {
      return element.title.toLowerCase().contains(keyword.toLowerCase());
    }).toList();
    notifyListeners();
  }

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

  Future getCart(String id) async {
    var uri = Uri.parse('https://dummyjson.com/carts/$id');
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      final String singleCart = response.body;

      return json.decode(singleCart);
    }
  }
} //End here
  // Future<Products?> fetchProducts() async {
  //   try {
  //     var client = http.Client();
  //     var uri = Uri.parse('https://dummyjson.com/products');
  //     var response = await client.get(uri);

  //     if (response.statusCode == 200) {
  //       var json = response.body;
  //       print(json);
  //       return productsFromJson(json);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future fetchProducts() async {
  //   // final  apiUrl = "https://reqres.in/api/users";
  //   var uri = Uri.parse('https://dummyjson.com/products');
  //   final response = await http.get(uri);

  //   if (response.statusCode == 200) {
  //     final String responseString = response.body;
  //     // print(responseString);
  //     return json.decode(responseString);
  //   }
  // }
