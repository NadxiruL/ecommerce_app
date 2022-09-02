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
            itemCount: 7,
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


// Container(
//             margin: EdgeInsets.only(top: 20),
//             child: Column(
//               children: [
//                 Row(
//                   children: const [
//                     Padding(
//                       padding: EdgeInsets.only(left: 15),
//                       child: Text(
//                         'Categories',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   height: 50,
//                   // color: Colors.amber,
//                   // color: Colors.amberAccent,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: 7,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         elevation: 5,
//                         child: Padding(
//                           padding: const EdgeInsets.all(5.0),
//                           child:
//                               Text(loadData.produk!.products[index].category),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           )