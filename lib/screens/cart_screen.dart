import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  // const CartScreen({super.key});

  bool isAvailable = false;

  @override
  Widget build(BuildContext context) {
    return isAvailable
        ? Container()
        : Column(
            children: [
              Text(
                'Your Cart is EMPTY',
                style: TextStyle(fontSize: 30),
              ),
            ],
          );
  }
}
