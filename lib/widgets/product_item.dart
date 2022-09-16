// import 'package:ecommerce_app/screens/product_details_screen.dart';
import 'package:ecommerce_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../providers/product.dart';

// class ProductItem extends StatefulWidget {
//   const ProductItem({super.key});

//   // final String imageUrl;
//   // final String productId;

//   // const ProductItem(
//   //     {super.key, required this.imageUrl, required this.productId});

//   @override
//   State<ProductItem> createState() => _ProductItemState();
// }

// class _ProductItemState extends State<ProductItem> {
//   @override
//   void initState() {
//     Provider.of<ProductProvider>(context, listen: false).getProducts();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final productData = Provider.of<ProductProvider>(context);
//     final product = Provider.of<Product?>(context, listen: false);

//     return productData.isLoading
//         ? Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             elevation: 5,
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.of(context).pushNamed(
//                   ProductDetailsScreen.routeName,
//                   arguments: product?.id,
//                 );
//               },
//               child: Consumer<Product>(
//                 builder: (context, value, _) => ClipRRect(
//                   borderRadius: const BorderRadius.all(Radius.circular(10)),
//                   child: Image.network(
//                     product?.thumbnail as String,
//                     //   errorBuilder: (BuildContext context, Object exception,
//                     //       StackTrace? stackTrace) {
//                     // return const Text('😢');
//                     //}
//                   ),
//                 ),
//               ),
//             ),
//           )
//         : const CircularProgressIndicator();
//   }
// }

// class ProductItem extends StatelessWidget {
//   const ProductItem({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final product = Provider.of<ApiService>(context).fetchAll();
//     return FutureBuilder(
//       future: product,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Card(
//             child:
//                 Image.network(snapshot.data['products']['thumbnail'] as String),
//           );
//         }
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       },
//     );
//   }
// }
