import 'package:flutter/material.dart';
import 'package:waster/core/helpers/shared_prefs_helper.dart';

class ThemeController extends ChangeNotifier {
  static final ThemeController instance = ThemeController._internal();
  ThemeController._internal();

  static const _key = 'isDarkMode';
  bool _isDark = false;
  bool get isDark => _isDark;

  Future<void> loadTheme() async {
    _isDark = SharedPrefsHelper.getBool(_key) ?? false;
    notifyListeners();
  }

  Future<void> setDark(bool value) async {
    if (_isDark == value) return;
    _isDark = value;
    notifyListeners();
    await SharedPrefsHelper.setBool(_key, _isDark);
  }

  Future<void> toggleTheme() => setDark(!_isDark);
}
