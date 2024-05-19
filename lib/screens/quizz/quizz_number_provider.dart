import 'package:flutter/material.dart';

class QuizzNUmberProvider extends ChangeNotifier {
  int selectedIndex = 0;
  bool clicked = false;
  changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  changeClicked(bool state) {
    clicked = state;
    notifyListeners();
  }
}
