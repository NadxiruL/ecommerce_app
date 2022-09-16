import 'package:flutter/material.dart';

class AddtoCart extends StatelessWidget {
  const AddtoCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Added to cart'),
            duration: Duration(seconds: 1),
          ),
        );
      },
      child: Icon(Icons.add_shopping_cart),
    );
  }
}
