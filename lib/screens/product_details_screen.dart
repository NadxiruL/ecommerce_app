import 'package:ecommerce_app/providers/product.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String imageUrl;
  const ProductDetailsScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // final data = ModalRoute.of(context)!.settings.arguments as ProductElement;

    return Scaffold(
      body: Container(
        child: Image.network(imageUrl),
      ),
    );
  }
}
