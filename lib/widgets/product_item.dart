import 'package:ecommerce_app/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

class ProductItem extends StatefulWidget {
  // final String imageUrl;
  // final String productId;

  // const ProductItem(
  //     {super.key, required this.imageUrl, required this.productId});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  // selectProduct(BuildContext context) {
  //   Navigator.of(context).pushNamed(
  //     ProductDetailsScreen.routeName,
  //     arguments: {
  //       widget.productId,
  //     },
  //   );
  // }

  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final product = Provider.of<Product?>(context);

    return productData.isLoading
        ? Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ProductDetailsScreen.routeName,
                  arguments: product?.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.network(product?.thumbnail as String, errorBuilder:
                    (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                  return const Text('😢');
                }),
              ),
            ),
          )
        : CircularProgressIndicator();
  }
}
