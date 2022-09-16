import 'package:ecommerce_app/screens/product_details_screen.dart';
import 'package:ecommerce_app/services/api_service.dart';
import 'package:ecommerce_app/widgets/product_item.dart';

import '../providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  final bool showFavs;
  const ProductList({super.key, this.showFavs = true});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ApiService>(context).fetchAll();

    return FutureBuilder<Products?>(
      future: product,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data?.products.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ProductDetailsScreen.routeName,
                          arguments: snapshot.data?.products[index].id);
                    },
                    child: Image.network(
                        snapshot.data?.products[index].thumbnail ?? ''),
                  ),
                ),
              );
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}



// return ListView.builder(
    //   scrollDirection: Axis.horizontal,
    //   itemCount: product.product?.products.length,
    //   itemBuilder: (context, index) {
    //     //Cycle or reuse the sama data kat bawah ni.
    //     //guna .value untuk void small , minor bugs.
    //     return ChangeNotifierProvider.value(
    //       value: product.product?.products[index],
    //       child: const ProductItem(
    //           // productId: product.product?.products[index].id ?? '',
    //           // imageUrl: product.product?.products[index].thumbnail ?? '',
    //           ),
    //     );
    //   },
    // );