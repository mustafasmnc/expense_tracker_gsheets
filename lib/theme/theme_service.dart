import 'package:expense_tracker_gsheets/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  SharedPreferences? _preferences;
  static ThemeService instance = ThemeService._privateConstructor();

  ThemeService._privateConstructor();

  static Future<void> init() async {
    instance._preferences = await SharedPreferences.getInstance();
  }

  bool isDarkMode() => _preferences!.getBool("isDarkMode") ?? false;

  //ThemeData get theme => isDarkMode() ? ThemeData.dark() : ThemeData.light();
  ThemeData get theme => isDarkMode() ? Themes.dark : Themes.light;

  void switchTheme() {
    _preferences!.setBool("isDarkMode", !isDarkMode());
    print(theme);
  }
}
