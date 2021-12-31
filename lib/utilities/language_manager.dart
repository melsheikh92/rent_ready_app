import 'package:rent_ready_app/core/contstants/SharedPreferenceConstants.dart';
import 'package:rent_ready_app/di/InjectionContainer.dart';
import 'package:rent_ready_app/features/settings/bloc/SettingsConfigBloc.dart';
import 'package:rent_ready_app/features/settings/bloc/events/LanguageEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LanguageManager {

  final SharedPreferences sharedPreferences;

  LanguageManager(this.sharedPreferences);

  static const _arabicLocale = Locale("ar");
  static const _englishLocale = Locale("en");

  bool get isEnglish {
    return _selectedLanguage == "en";
  }

  Locale get preferredLanguageForDateTime {
    return _englishLocale;
  }

  Locale get preferredLanguageForCurrency {
    return _englishLocale;
  }
  /// setup english as default
  String _selectedLanguage = 'en';

  Future setPreferredLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(languagePreference, language);
    _selectedLanguage = language;

  }

  Future<String> getPreferredLanguage() async {
    _selectedLanguage = sharedPreferences.getString(languagePreference);
    if (_selectedLanguage == null) setPreferredLanguage('en');
    return _selectedLanguage;
  }

  Future<Locale> get currentLanguageLocale async {
    final String localeString = await getPreferredLanguage();
    return localeString == "en" ? _englishLocale : _arabicLocale;
  }

  void changeLanguage(BuildContext context) {
    final String lang = isEnglish ? "ar" : "en";
    _selectedLanguage = lang;
    BlocProvider.of<SettingsConfigBloc>(context).add(LanguageChangedEvent(lang:lang));
  }

}
