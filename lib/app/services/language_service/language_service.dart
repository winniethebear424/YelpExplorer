import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'en.dart';
import 'vi.dart';

final class TranslationService extends Translations {
  static var fallbackLocale = Locale('vi', 'VN');

  static String localToString(Locale locale) {
    return locale.languageCode + "-" + locale.countryCode.toString();
  }

  static Locale localFromString(String text) {
    var code = text.split("-");
    return Locale(code.first, code.last);
  }

  static Future<Null> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lang = prefs.getString(LocalStorageKey.currentLanguage);
    if (lang != null && lang.isNotEmpty)
      fallbackLocale = localFromString(lang);
    else
      fallbackLocale = fallbackLocale;
    return null;
  }

  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'vi': vi};

  static updateLocale(Locale locale) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Get.updateLocale(locale);
    fallbackLocale = locale;
    prefs.setString(LocalStorageKey.currentLanguage, localToString(locale));
  }

  static Map<String, String> lstLanguage = {
    'en': 'Drawer_Language_English',
    'vi': 'Drawer_Language_Vietnamese',
  };
}
