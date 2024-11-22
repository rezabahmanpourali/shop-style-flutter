import 'package:flutter/material.dart';

class GlobalController extends ChangeNotifier {
  String? token;
  void setToken(String inputToken) {
    token = inputToken;
    notifyListeners();
  }
}
