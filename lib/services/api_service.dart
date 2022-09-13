import 'dart:convert';

import 'package:http/http.dart' as http;
// import '../providers/cart.dart';

import '../providers/product.dart';

class ApiService {
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

  Future<Products?> fetchProducts() async {
    // final  apiUrl = "https://reqres.in/api/users";
    var uri = Uri.parse('https://dummyjson.com/products');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final String responseString = response.body;
      // print(responseString);
      return productsFromJson(responseString);
    }
  }

  Future fetchAll() async {
    var uri = Uri.parse('https://dummyjson.com/products/');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final String categories = response.body;
      //  print(categories);
      return json.decode(categories);
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
      print(categoryName);
      return json.decode(categoryName);
    }
  }

//   Future<Cart?> addtoCart(String id, String title, String price) async {
//     var uri = Uri.parse('https://dummyjson.com/carts/add');
//     var response = await http.post(uri,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           "userId": 1,
//           "products": [
//             {
//               "id": id,
//               "title": title,
//               "price": price,
//             },
//           ]
//         }));

//     if (response.statusCode == 201) {
//       var json = response.body;
//       print(response.body);
//       return cartFromJson(json);
//     }
//   }
// }
}
