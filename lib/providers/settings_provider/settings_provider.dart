import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLang = 'en';

  void changeAppLanguage(String newLang) {
    if (newLang == currentLang) {
      return;
    }
    currentLang = newLang;
    notifyListeners();
  }

  void changeThemeMode(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  String getBackgroundImageName() {
    return currentTheme == ThemeMode.light
        ? 'main_background.png'
        : 'main_background_dark.png';
  }
}
