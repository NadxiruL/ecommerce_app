import 'package:http/http.dart' as http;
import '../providers/product.dart';

class ApiService {
  // Future<Product?> fetchProducts() async {
  //   try {
  //     var client = http.Client();
  //     var uri = Uri.parse('https://dummyjson.com/products');
  //     var response = await client.get(uri);

  //     if (response.statusCode == 200) {
  //       var json = response.body;
  //       print(json);
  //       return productFromJson(json);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<Product?> fetchProducts() async {
    // final  apiUrl = "https://reqres.in/api/users";
    var uri = Uri.parse('https://dummyjson.com/products');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final String responseString = response.body;

      return productFromJson(responseString);
    }
  }
}
