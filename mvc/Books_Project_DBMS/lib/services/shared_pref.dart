
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSharedPreferences {

  Future<void> saveThemePref(String themeNotifierValue) async {

    final themePref = await SharedPreferences.getInstance();
    await themePref.setString('theme', themeNotifierValue);

  }

  Future<String?> getThemePref() async {
    final themePref = await SharedPreferences.getInstance();
    return themePref.getString('theme');
  }

}