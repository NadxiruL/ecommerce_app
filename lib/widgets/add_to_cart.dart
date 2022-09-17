import 'package:flutter/material.dart';

class AddtoCart extends StatelessWidget {
  final VoidCallback onPress;
  final Widget iconButton;
  const AddtoCart({super.key, required this.onPress, required this.iconButton});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPress,
      child: iconButton,
    );
  }
}
