import 'package:flutter/material.dart';

class AllProductsWidget extends StatelessWidget {
  const AllProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              itemCount: 7,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.network(
                        'https://img.shoppegram.com/coffee_amapola_tarra_86ekdfbvqfuc7zhjgu6c.jpg'),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
