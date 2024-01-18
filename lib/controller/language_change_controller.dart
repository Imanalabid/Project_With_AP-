import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeController with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  // Add this method to toggle between light and dark modes
  void toggleThemeMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  Locale? _appLocale;
  Locale? get appLocale => _appLocale;

  void changeLanguage(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (type == Locale('ar')) {
      await sp.setString('language_code', 'ar');
    } else {
      await sp.setString('language_code', 'en');
    }
    _appLocale = type;
    notifyListeners(); // Notify listeners after changing the language
  }
}
