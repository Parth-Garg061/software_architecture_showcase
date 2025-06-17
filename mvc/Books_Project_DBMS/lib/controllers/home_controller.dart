import 'package:books_project_dbms/main.dart';
import 'package:books_project_dbms/services/shared_pref.dart';
import 'package:flutter/material.dart';

class HomeController {

  Future<void> loadSavedValue() async {
    String? theme = await ThemeSharedPreferences().getThemePref();

    if (theme != null) {
      themeNotifier.value = theme == "dark" ? ThemeMode.dark : ThemeMode.light;
    }
  }

  void saveValue(String themeValue) async {
    await ThemeSharedPreferences().saveThemePref(themeValue!);
    themeNotifier.value = themeValue == "dark" ? ThemeMode.dark : ThemeMode.light;
  }

}