import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static final String userNameKey = 'userNameKey';
  static final String emailKey = 'emailKey';
  static Future<bool> saveuserName(String userName) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return await shared.setString(userNameKey, userName);
  }

  static Future<bool> saveEmail(String email) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return await shared.setString(emailKey, email);
  }

  static Future<String> getUserName() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return await shared.getString(userNameKey);
  }

  static Future<String> getEmail() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return await shared.getString(emailKey);
  }
}
