import 'package:flutter/material.dart';

class GlobalController extends ChangeNotifier {
  String? token;
  int selectedIdex = 3;
  void setToken(String inputToken) {
    token = inputToken;
    notifyListeners();
  }

  void update(int index) {
    selectedIdex = index;
    notifyListeners();
  }
}
