import 'package:ecommerce_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryProduct extends StatelessWidget {
  final String categoryName;

  const CategoryProduct({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          categoryName.toUpperCase(),
        ),
      ),
      body: FutureBuilder(
        future: ApiService().getProductsCategory(categoryName),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(12),
                  child: ListTile(
                    leading: Image.network(
                        snapshot.data['products'][index]['thumbnail']),
                    title: Text(snapshot.data['products'][index]['title']),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
