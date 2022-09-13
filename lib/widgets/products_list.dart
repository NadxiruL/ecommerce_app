import 'package:ecommerce_app/widgets/product_item.dart';

import '../providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  final bool showFavs;
  const ProductList({super.key, this.showFavs = true});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);
    final products = showFavs ? product.favoriteItems : product;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      // itemCount: product.product.length,
      itemCount: product.product?.products.length,
      itemBuilder: (context, index) {
        //Cycle or reuse the sama data kat bawah ni.
        //guna .value untuk void small , minor bugs.
        return ChangeNotifierProvider.value(
          value: product.product?.products[index],
          child: const ProductItem(
              // productId: product.product?.products[index].id ?? '',
              // imageUrl: product.product?.products[index].thumbnail ?? '',
              ),
        );
      },
    );
  }
}
