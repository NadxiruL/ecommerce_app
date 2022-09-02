import 'package:ecommerce_app/providers/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  void initState() {
    final product = Provider.of<Products>(context, listen: false);
    super.initState();
    product.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final loadData = Provider.of<Products>(context);

    return loadData.isLoading
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: loadData.produk!.products.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(loadData.produk!.products[index].category),
                ),
              );
            },
          )
        : CircularProgressIndicator();
  }
}
