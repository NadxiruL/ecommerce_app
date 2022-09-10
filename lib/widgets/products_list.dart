import 'package:ecommerce_app/widgets/product_item.dart';

import '../providers/product.dart';
import '../screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class AllProductsWidget extends StatefulWidget {
//   const AllProductsWidget({super.key});

//   @override
//   State<AllProductsWidget> createState() => _AllProductsWidgetState();
// }

// class _AllProductsWidgetState extends State<AllProductsWidget> {
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<Products>(context, listen: false).getProducts();
//     // data.getProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final data = Provider.of<Products>(context);
//     return data.isLoading
//         ? Column(
//             children: [
//               Container(
//                 height: 160,
//                 child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: data.produk!.products.length,
//                     itemBuilder: (context, index) {
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ProductDetailsScreen(
//                                 imageUrl:
//                                     data.produk!.products[index].thumbnail,
//                                 title: data.produk!.products[index].title,
//                                 description:
//                                     data.produk!.products[index].description,
//                                 price: data.produk!.products[index].price,
//                               ),
//                             ),
//                           );
//                         },
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           elevation: 5,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.all(Radius.circular(10)),
//                             child: Image.network(
//                                 data.produk!.products[index].thumbnail),
//                           ),
//                         ),
//                       );
//                     }),
//               ),
//             ],
//           )
//         : CircularProgressIndicator();
//   }
// }

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      // itemCount: product.product.length,
      itemCount: product.product?.products.length,
      itemBuilder: (context, index) {
        return ProductItem(
            // productId: product.product[index].id,
            productId: product.product?.products[index].id ?? '',
            imageUrl: product.product?.products[index].thumbnail ?? '');
      },
    );
  }
}
