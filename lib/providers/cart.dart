// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

CartElement cartElementFromJson(String str) =>
    CartElement.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart with ChangeNotifier {
  Cart({
    required this.carts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  List<CartElement> carts;
  int total;
  int skip;
  int limit;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        carts: List<CartElement>.from(
            json["carts"].map((x) => CartElement.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "carts": List<dynamic>.from(carts.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class CartElement with ChangeNotifier {
  CartElement({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  int id;
  List<Product> products;
  int total;
  int discountedTotal;
  int userId;
  int totalProducts;
  int totalQuantity;

  factory CartElement.fromJson(Map<String, dynamic> json) => CartElement(
        id: json["id"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        discountedTotal: json["discountedTotal"],
        userId: json["userId"],
        totalProducts: json["totalProducts"],
        totalQuantity: json["totalQuantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "total": total,
        "discountedTotal": discountedTotal,
        "userId": userId,
        "totalProducts": totalProducts,
        "totalQuantity": totalQuantity,
      };
}

class Product with ChangeNotifier {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedPrice,
  });

  int id;
  String title;
  int price;
  int quantity;
  int total;
  double discountPercentage;
  int discountedPrice;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        quantity: json["quantity"],
        total: json["total"],
        discountPercentage: json["discountPercentage"].toDouble(),
        discountedPrice: json["discountedPrice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "quantity": quantity,
        "total": total,
        "discountPercentage": discountPercentage,
        "discountedPrice": discountedPrice,
      };
}

// class Carts with ChangeNotifier {
//   Cart? cart;
//   bool isLoading = false;

//   addCart(String id, String title, String price) async {
//     cart = await ApiService().addtoCart(id, title, price);

//     if (cart != null) {
//       isLoading = true;
//     }
//     print(cart);
//     notifyListeners();
//   }
// }
