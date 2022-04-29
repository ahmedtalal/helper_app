import 'package:shared_preferences/shared_preferences.dart';

class StorageAppTheme {
  const StorageAppTheme();
  static const String _themeKey = "themeAppKey";

  Future<SharedPreferences> _getInit() async {
    return await SharedPreferences.getInstance();
  }

  Future<bool?> getThemeMode() async {
    bool? result;
    await _getInit().then((SharedPreferences shared) {
      result = shared.getBool(_themeKey) ?? false;
    });
    return result;
  }

  Future<bool> setThemeMode(data) async {
    bool? result;
    await _getInit().then((SharedPreferences shared) async {
      result = await shared.setBool(_themeKey, data);
    });
    return result!;
  }
}
