import 'dart:convert';

import 'package:ecommerce_app/providers/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../providers/cart.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

// Future<UserModel?> submit(String name, String job) async {
//   // var client = http.Client();
//   var uri = Uri.parse('https://reqres.in/api/users');
//   var response = await http.post(uri, body: {
//     "name": name,
//     "job": job,
//   });
//   print(response.body);
//   if (response.statusCode == 200) {
//     var json = response.body;

//     return userModelFromJson(json);
//   } else {
//     return null;
//   }
// }

Future<UserModel?> createUser(String name, String jobTitle) async {
  // final  apiUrl = "https://reqres.in/api/users";
  var uri = Uri.parse('https://reqres.in/api/users');
  final response = await http.post(uri, body: {"name": name, "job": jobTitle});

  if (response.statusCode == 201) {
    final String responseString = response.body;
    print(responseString);
    return userModelFromJson(responseString);
  } else {
    return null;
  }
}

class _CartScreenState extends State<CartScreen> {
  // const CartScreen({super.key});

  bool isAvailable = true;

  UserModel? _userModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: ElevatedButton(
            onPressed: () async {
              final UserModel? userModel =
                  await createUser('nadzirulx', 'kuli sahaja');
              setState(() {
                _userModel = userModel;
              });
            },
            child: Text('Press'),
          ),
        ),
        _userModel == null
            ? CircularProgressIndicator()
            : Text("The user ${_userModel!.name}")
      ],
    );
    //
    //   ],
    // );
    // isAvailable
    //     ? Container()
    //     : Column(
    //         children: [
    //           Text(
    //             'Your Cart is EMPTY',
    //             style: TextStyle(fontSize: 30),
    //           ),
    //         ],
    //       );
  }
}
