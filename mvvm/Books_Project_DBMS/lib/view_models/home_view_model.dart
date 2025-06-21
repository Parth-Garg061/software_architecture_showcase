import 'package:books_project_dbms/main.dart';
import 'package:books_project_dbms/services/shared_pref.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  Future<void> loadSavedValue() async {
    final saved = await ThemeSharedPreferences().getThemePref();
    _themeMode = saved == 0 ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void saveValue(ThemeMode theme) async {

    final themeValueString = theme == ThemeMode.light ? "light" : "dark";
    await ThemeSharedPreferences().saveThemePref(themeValueString);
    _themeMode = theme;
    notifyListeners();
  }

}