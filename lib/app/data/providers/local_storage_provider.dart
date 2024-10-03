import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageProvider {
  final SharedPreferences sharedPreferences;
  final String _appKey = 'app';

  LocalStorageProvider(
    this.sharedPreferences,
  );

  Future<void> setLoginStatus(bool value) async {
    await sharedPreferences.setBool('$_appKey.loginStatus', value);
  }

  bool getLoginStatus() {
    return sharedPreferences.getBool('$_appKey.loginStatus') ?? false;
  }
}
