import 'package:ecommerce_app/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProductsWidget extends StatefulWidget {
  const AllProductsWidget({super.key});

  @override
  State<AllProductsWidget> createState() => _AllProductsWidgetState();
}

class _AllProductsWidgetState extends State<AllProductsWidget> {
  @override
  void initState() {
    super.initState();
    final prov = Provider.of<Produk>(context, listen: false);
    prov.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Produk>(context);
    return data.isLoading
        ? Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(12),
            height: 250,
            // color: Colors.amber,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'All Products',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  // color: Colors.blue,
                  height: 190,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.produk!.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.network(
                              data.produk!.products[index].thumbnail),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        : CircularProgressIndicator();
  }
}
