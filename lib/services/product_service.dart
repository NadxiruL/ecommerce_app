import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../providers/products.dart';

class ApiService {
  Future<Product?> fetchProducts() async {
    try {
      var client = http.Client();
      var uri = Uri.parse('https://dummyjson.com/products');
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        print(json);
        return productFromJson(json);
      }
    } catch (e) {
      print(e);
    }
  }
}

class Produk with ChangeNotifier {
  Product? produk;
  bool isLoading = false;
  getProducts() async {
    produk = await (ApiService().fetchProducts());

    if (produk != null) {
      isLoading = true;
    }

    notifyListeners();
  }
}
