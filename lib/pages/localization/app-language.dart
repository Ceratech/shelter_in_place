import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = Locale('en');

  Locale get appLocal => _appLocale ?? Locale("en");
  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale('en');
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code'));
    return Null;
  }


  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == Locale("en")) {
      _appLocale = Locale("en");
      await prefs.setString('language_code', 'en');
    } else if (type == Locale("es"))  {
      _appLocale = Locale("es");
      await prefs.setString('language_code', 'es');
    } else {
    _appLocale = Locale("nl");
    await prefs.setString('language_code', 'nl');
    }
    notifyListeners();
  }
}