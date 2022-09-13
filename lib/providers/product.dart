import 'package:flutter/material.dart';
import 'dart:convert';

import '../services/api_service.dart';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products with ChangeNotifier {
  Products({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  List<Product> products;
  int total;
  int skip;
  int limit;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Product with ChangeNotifier {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
    this.isFavorite = false,
  });

  String id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;
  bool isFavorite;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"].toString(),
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"].toDouble(),
        rating: json["rating"].toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}

class ProductProvider with ChangeNotifier {
  Products? product;

  bool isLoading = false;

  //show favorites

  var _showFavoritesOnly = false;

  getProducts() async {
    product = (await (ApiService().fetchProducts()));

    if (product != null) {
      isLoading = true;
    }
    //jika
    if (_showFavoritesOnly) {
      return product!.products.where((element) => element.isFavorite).toList();
    }

    notifyListeners();
  }

  List<Product>? get favoriteItems {
    return product?.products.where((element) => element.isFavorite).toList();
  }

  //show favorites

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  bool isFavorite = true;

  void toggleFav() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

//find product with specific id
  Product findById(String? productId) {
    return product!.products.firstWhere((element) => element.id == productId);
  }
}
