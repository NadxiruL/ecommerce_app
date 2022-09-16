import 'package:ecommerce_app/providers/product.dart';
import 'package:ecommerce_app/screens/category_product_screen.dart';
import 'package:ecommerce_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class CategoriesWidget extends StatefulWidget {
//   const CategoriesWidget({super.key});

//   @override
//   State<CategoriesWidget> createState() => _CategoriesWidgetState();
// }

// class _CategoriesWidgetState extends State<CategoriesWidget> {
//   @override
//   void initState() {
//     final product = Provider.of<ProductProvider>(context, listen: false);
//     super.initState();
//     product.getProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final loadData = Provider.of<ProductProvider>(context);

//     return loadData.isLoading
//         ? ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: loadData.product!.products.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 elevation: 5,
//                 child: Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Text(loadData.product!.products[index].category),
//                 ),
//               );
//             },
//           )
//         : const CircularProgressIndicator();
//   }
// }

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final categories =
        Provider.of<ApiService>(context, listen: false).getCategories();
    return FutureBuilder(
      future: categories,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return InkWell(
                // splashColor: Color.fromARGB(255, 247, 294, 234),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CategoryProduct(
                      categoryName: snapshot.data[index],
                    ),
                  ));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(snapshot.data[index].toString().toUpperCase()),
                  ),
                ),
              );
            },
          );
        }

        return CircularProgressIndicator();
      },
    );
  }
}
