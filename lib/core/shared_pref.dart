import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future<void> saveToken(String token) async {
    //save the token in the local storage by shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
