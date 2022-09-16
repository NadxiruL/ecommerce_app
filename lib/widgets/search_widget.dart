import 'package:ecommerce_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

final _filter = TextEditingController();

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    final search = Provider.of<ApiService>(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        autofocus: false,
        onChanged: (value) {
          search.searchText = value;
          search.searchProducts(value);
        },
        controller: _filter,
        decoration: InputDecoration(
          labelText: 'Search..',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
