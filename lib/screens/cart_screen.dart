import 'dart:convert';

import 'package:ecommerce_app/providers/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../providers/cart.dart';
import '../providers/utils.dart';

class CartScreen extends StatefulWidget {
  final String id;
  final String quantity;
  CartScreen({super.key, required this.id, required this.quantity});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

Future<UserModel?> submit(String name, String job) async {
  // var client = http.Client();
  // var uri = Uri.parse('https://reqres.in/api/users');
  // var response = await http.post(uri, body: {
  //   "name": name,
  //   "job": job,
  // });
  // print(response.body);
  // if (response.statusCode == 201) {
  //   var json = response.body;

  //   return userModelFromJson(json);
  // } else {
  //   return null;
  // }
}

class _CartScreenState extends State<CartScreen> {
  // const CartScreen({super.key});

  bool isAvailable = true;

  UserModel? _userModel;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: BoxDecoration(
    //     gradient: LinearGradient(
    //       begin: Alignment.bottomCenter,
    //       end: Alignment.topCenter,
    //       colors: color,
    //     ),
    //   ),
    // child: Scaffold(
    //   backgroundColor: Colors.transparent,
    return Column(
      children: [
        // Container(
        //   child: ElevatedButton(
        //     onPressed: () async {
        //       final UserModel? userModel =
        //           await submit('nadzirulx', 'kuli sahaja');
        //       setState(() {
        //         _userModel = userModel;
        //       });
        //     },
        //     child: Text('Press'),
        //   ),
        // ),
        // isAvailable
        //     ? Text("The user is ${_userModel?.name ?? ''}")
        //     : CircularProgressIndicator()
        Text('test'),
        Text(widget.id),
        Text(widget.quantity),
      ],
    );
    //   ),
    // );
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
