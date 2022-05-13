import 'package:flutter/material.dart';
import 'package:saied_app/src/config/themes/app_theme.dart';
import 'package:saied_app/src/domain/repositories/local/i_shared_repository.dart';

class AppThemeProvider extends ChangeNotifier {
  static late bool _isDark;
  final IsharedRepository isharedRepository;
  AppThemeProvider(this.isharedRepository) {
    _isDark = false;
    getTheme();
  }

  ThemeData switchThemeMode() {
    return _isDark ? AppTheme.dark : AppTheme.light;
  }

  getTheme() async {
    await isharedRepository.getData().then((bool? value) {
      _isDark = value!;
    });
    notifyListeners();
  }

  bool checkMode() => _isDark;

  setTheme() async {
    _isDark = !_isDark;
    await isharedRepository.savedData(_isDark).then((bool value) {
      // ignore: avoid_print
      print(value);
    });
    notifyListeners();
  }
}
