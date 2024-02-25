import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController {
  static SharedPreferences? _sharedPreferences;
  static SharedPreferencesController? _instance;

  SharedPreferencesController._();

  static SharedPreferencesController getInstance() {
    if (_instance == null) {
      _instance = SharedPreferencesController._();
      _instance!._init();
    }
    return _instance!;
  }

  void _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    await _sharedPreferences?.setString(key, value);
  }

  Future<String?> getString(String key) async {
    return _sharedPreferences?.getString(key);
  }
}
