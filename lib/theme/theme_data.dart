import 'package:expense_tracker_gsheets/theme/theme_service.dart';
import 'package:flutter/material.dart';

class CustomThemeDataModal extends ChangeNotifier {
  ThemeData? get getThemeData => ThemeService.instance.theme;

  void setThemeData() {
    ThemeService.instance.switchTheme();
    notifyListeners();
  }
}
