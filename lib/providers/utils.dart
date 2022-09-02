import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Utils extends ChangeNotifier {
  int selectedIndex = 0;

  onItemTap(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

List<Color> color = <Color>[
  Color.fromARGB(255, 5, 155, 201),
  Color.fromARGB(255, 255, 255, 255),
];
