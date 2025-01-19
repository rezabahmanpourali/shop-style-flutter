import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_style/barber/model/barber_shop_model.dart';

class GlobalController extends ChangeNotifier {
  String? token;
  int selectedIndex = 0;
  String language = 'en';
  BuildContext? context;

  final FlutterSecureStorage _storage = FlutterSecureStorage();
  List<BarberShopModel> bookmarkedShops = [];

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
