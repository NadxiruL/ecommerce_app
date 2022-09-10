import 'package:flutter/material.dart';
import 'dart:convert';

import '../services/api_service.dart';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
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

class Product {
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

  getProducts() async {
    product = (await (ApiService().fetchProducts()));

    if (product != null) {
      isLoading = true;
    }
    notifyListeners();
  }

  Product findById(String productId) {
    return product!.products.firstWhere((element) => element.id == productId);
  }

  // List<Products> _allproduct = [
  //   Products(
  //     id: '1',
  //     title: 'Nike',
  //     description: 'Nike Shoes',
  //     price: 20,
  //     discountPercentage: 10,
  //     rating: 5,
  //     stock: 100,
  //     brand: 'Nike',
  //     category: 'Shoes',
  //     thumbnail:
  //         'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/e125b578-4173-401a-ab13-f066979c8848/air-force-1-older-shoes-w6PsF3.png',
  //     images: [
  //       'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/e125b578-4173-401a-ab13-f066979c8848/air-force-1-older-shoes-w6PsF3.png',
  //       'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/e125b578-4173-401a-ab13-f066979c8848/air-force-1-older-shoes-w6PsF3.png'
  //     ],
  //   ),
  //   Products(
  //     id: '2',
  //     title: 'Nike',
  //     description: 'Nike Shoes',
  //     price: 30,
  //     discountPercentage: 10,
  //     rating: 5,
  //     stock: 1500,
  //     brand: 'Nike',
  //     category: 'Shoes',
  //     thumbnail:
  //         'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/ebad848a-13b1-46d5-a85e-49b4b6a4953c/air-force-1-le-older-shoe-TDGHCN.png',
  //     images: [
  //       'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/ebad848a-13b1-46d5-a85e-49b4b6a4953c/air-force-1-le-older-shoe-TDGHCN.png',
  //       'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/ebad848a-13b1-46d5-a85e-49b4b6a4953c/air-force-1-le-older-shoe-TDGHCN.png'
  //     ],
  //   ),
  // ];

  // List<Products?> get products {
  //   return [..._allproduct];
  // }
}
