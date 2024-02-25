import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController {
  SharedPreferences? _sharedPreferences;

  SharedPreferencesController() {
    _init();
  }

  void _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    _sharedPreferences!.setString(key, value);
  }

  Future<String?> getString(String key) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!.getString(key);
  }
}
