import 'package:flutter/material.dart';

class GlobalController extends ChangeNotifier {
  String? token;
  int selectedIndex = 0;
  String language = 'en';
  BuildContext? context;

  

  void setToken(String inputToken) {
    token = inputToken;
    notifyListeners();
  }

  void changeLanguage(String languageInput) {
    language = languageInput;
    notifyListeners();
  }

  void update(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
