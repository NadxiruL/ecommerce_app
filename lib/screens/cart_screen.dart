import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../providers/utils.dart';
import '../services/api_service.dart';

class CartScreen extends StatefulWidget {
  // final String id;
  // final String quantity;
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // const CartScreen({super.key});

  bool isAvailable = false;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ApiService>(context, listen: false).getCart('2');
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: color,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
          future: cart,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data['products'].length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data['products'][index]['title']),
                    subtitle: Text(
                        '\$ ${snapshot.data['products'][index]['price'].toString()}'),
                    trailing:
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        bottomNavigationBar: Container(
          height: 50,
          child: ElevatedButton(
            child: Text('CHECKOUT'),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('ERROR'),
                  content: const Text('NO PAYMENT GATEWAY'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
