
import 'package:rent_ready_app/di/InjectionContainer.dart';
import 'package:rent_ready_app/utilities/language_manager.dart';
import 'package:flutter/material.dart';


    
class AppSVGAssets {

    static const success = "success";
static const error = "error";
static const noticeIcon = "notice_icon";



static const Map _assetsMap ={'light': {'ar': {}, 'en': {'success': 'assets/svg_images/light/en/success.svg', 'error': 'assets/svg_images/light/en/error.svg', 'notice_icon': 'assets/svg_images/light/en/notice_icon.svg'}}, 'dark': {'ar': {}, 'en': {}}};



static String getImagePath(BuildContext context,
      {@required String imageName}) {
    final String themeKey =
        Theme.of(context).brightness == Brightness.light ? "light" : "dark";
    final String languageKey = getIt<LanguageManager>().isEnglish ? "en" : "ar";
    if ((_assetsMap[themeKey][languageKey] as Map).containsKey(imageName)) {
      return _assetsMap[themeKey][languageKey][imageName] as String;
    } else if ((_assetsMap[themeKey]["en"] as Map).containsKey(imageName)) {
      return _assetsMap[themeKey]["en"][imageName] as String;
    } else if ((_assetsMap["light"][languageKey] as Map)
        .containsKey(imageName)) {
      return _assetsMap["light"][languageKey][imageName] as String;
    } else {
      return _assetsMap["light"]["en"][imageName] as String;
    }
  }
}
    