import 'package:flutter/material.dart';

class BottomsheetProvider extends ChangeNotifier {
  int selectedIndex = 0;
  changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
