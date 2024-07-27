import 'package:ringo/prefs/pref_keys.dart';
import 'package:ringo/prefs/pref_util.dart';

class PrefManager {
  static Future<bool> setLang(String? data) async {
    return await PrefUtils.setString(PrefKeys.lang, data!);
  }

  static Future<String?> getLang() async {
    return await PrefUtils.getString(PrefKeys.lang);
  }

  static Future<void> setLoggedIn({bool value = true}) async {
    await PrefUtils.setBool(PrefKeys.isLoggedIn, value);
  }

  static Future<bool> isLoggedIn() async {
    return await PrefUtils.getBool(PrefKeys.isLoggedIn);
  }
}
