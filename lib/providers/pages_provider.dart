import 'package:flutter/material.dart';

class PagesProvider with ChangeNotifier {
  int _selectedMenuOpt = 0;

  int get selectedMenuOpt => _selectedMenuOpt;

  set selectedMenuOpt(int i) {
    _selectedMenuOpt = i;
    notifyListeners();
  }
}
