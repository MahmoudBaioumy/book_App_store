import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencHelper {
  // static SharedPreferences? sharedPreferences;

  static late SharedPreferences sharedPreferences;

  static Future<SharedPreferences> init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

////////////savedata//////////////////////////////////////////////
  static Future<bool> saveData(
      {required dynamic key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    }
    if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else {
      return false;
    }
  }

////////////////getdata/////////////////////////////////////////////////
  static dynamic getData({required dynamic key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  static bool? getBool({required String key}) {
    return sharedPreferences.getBool(key);
  }
}
