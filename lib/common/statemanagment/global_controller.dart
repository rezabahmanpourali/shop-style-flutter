// import 'package:flutter/material.dart';

// class GlobalController extends ChangeNotifier {
//   String? token;
//   int selectedIndex = 0;
//   String language = 'en';
//   BuildContext? context;

//   void setToken(String inputToken) {
//     token = inputToken;
//     notifyListeners();
//   }

//   void changeLanguage(String languageInput) {
//     language = languageInput;
//     notifyListeners();
//   }

//   void update(int index) {
//     selectedIndex = index;
//     notifyListeners();
//   }
// }












import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // برای ذخیره‌سازی توکن
import 'package:shop_style/common/models/api_service.dart'; // برای استفاده از ApiClientV3
import 'package:shop_style/locator.dart'; // برای دسترسی به locator

class GlobalController extends ChangeNotifier {
  String? token;
  int selectedIndex = 0;
  String language = 'en';
  BuildContext? context;

  final SharedPreferences _prefs = locator.get(); // SharedPreferences برای ذخیره توکن

  // برای ذخیره‌سازی توکن
  Future<void> setToken(String inputToken) async {
    token = inputToken;
    await _prefs.setString('token', inputToken); // ذخیره توکن در SharedPreferences
    notifyListeners();
  }

  // برای دریافت توکن
  Future<String?> getToken() async {
    return _prefs.getString('token'); // خواندن توکن از SharedPreferences
  }

  // برای رفرش کردن توکن
  Future<void> refreshToken() async {
    String? currentToken = await getToken();

    if (currentToken == null) {
      print("No token available.");
      return;
    }

    // درخواست به سرور برای رفرش توکن
    final ApiClientV3 dio = locator.get();
    try {
      final response = await dio.get(
        'https://style-shop.liara.run/auth/customers/refresh/?token=$currentToken',
      );

      if (response.statusCode == 200) {
        String newToken = response.json['token'];
        await setToken(newToken); // ذخیره توکن جدید
        print("Saved token after refresh: $newToken");
        print('Token refreshed successfully!');
      } else {
        print('Failed to refresh token');
      }
    } catch (e) {
      print('Error refreshing token: $e');
    }
  }

  // برای تغییر زبان
  void changeLanguage(String languageInput) {
    language = languageInput;
    notifyListeners();
  }

  // برای تغییر ایندکس انتخاب شده
  void update(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

