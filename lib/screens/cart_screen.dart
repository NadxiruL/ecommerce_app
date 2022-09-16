import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../providers/cart.dart';
import '../providers/utils.dart';

class CartScreen extends StatefulWidget {
  final String id;
  final String quantity;
  const CartScreen({super.key, required this.id, required this.quantity});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // const CartScreen({super.key});

  bool isAvailable = true;

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
