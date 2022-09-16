import 'package:ecommerce_app/screens/product_details_screen.dart';
import 'package:ecommerce_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/utils.dart';

class CategoryProduct extends StatelessWidget {
  final String categoryName;

  const CategoryProduct({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ApiService>(context, listen: false)
        .getProductsCategory(categoryName);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: color,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            categoryName.toUpperCase(),
          ),
        ),
        body: FutureBuilder(
          future: product,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data['products'].length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(12),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          ProductDetailsScreen.routeName,
                          arguments: snapshot.data['products'][index]['id'],
                        );
                      },
                      child: ListTile(
                        leading: Image.network(
                            snapshot.data['products'][index]['thumbnail']),
                        title: Text(
                          snapshot.data['products'][index]['title'],
                        ),
                        subtitle: Text(
                            '\$ ${snapshot.data['products'][index]['price'].toString()}'),
                      ),
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
