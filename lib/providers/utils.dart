import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Utils extends ChangeNotifier {
  int selectedIndex = 0;

  onItemTap(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
