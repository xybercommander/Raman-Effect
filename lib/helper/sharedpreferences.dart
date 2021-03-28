import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  static String loggedInSharedPreferenceKey = 'LOGINKEY';
  static String nameSharedPreferenceKey = 'NAMEKEY';
  static String avatarSharedPreferenceKey = 'AVATARKEY';

  // ----------------SET FUNCTIONS----------------//
  static Future<void> saveLoggedInSharedPreference(bool isUserLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(loggedInSharedPreferenceKey, isUserLoggedIn);
  }

  static Future<void> saveNameSharedPreference(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nameSharedPreferenceKey, name);
  }

  static Future<void> saveAvatarSharedPreference(int avatar) async { // 1 - boy, 2 - girl
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setInt(avatarSharedPreferenceKey, avatar);
  } 


  // ----------------GET FUNCTIONS---------------- //
  static Future<bool> getLoggedInSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(loggedInSharedPreferenceKey);
  }

  static Future<String> getNameSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(nameSharedPreferenceKey);
  }

  static Future<int> getAvatarSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(avatarSharedPreferenceKey);
  }

}