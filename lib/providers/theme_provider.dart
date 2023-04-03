import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme {
    return _isDarkTheme;
  }

  void toggleTheme() {
    _isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
