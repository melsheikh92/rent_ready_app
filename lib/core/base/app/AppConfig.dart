
import 'dart:async';
import 'package:rent_ready_app/core/language/GlobalTranslations.dart';
import 'package:rent_ready_app/utilities/language_manager.dart';
import 'package:rent_ready_app/core/language/GlobalTranslations.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'ConfigReader.dart';

@lazySingleton
class AppConfig {

  final LanguageManager languageManager;

  AppConfig(this.languageManager);

  String getBaseUrl() {
    return ConfigReader.getBaseUrl();
  }
  String getClientId() {
    return ConfigReader.getClientId();
  }
  String getClientSecret() {
    return ConfigReader.getClientSecret();
  }
  String getGrantType() {
    return ConfigReader.getGrantType();
  }
  String getTenantId() {
    return ConfigReader.getTenantId();
  }
  String getScope() {
    return ConfigReader.getScope();
  }

  final StreamController<String> _languageController = StreamController<String>();
  Stream<String> get currentLanguage => _languageController.stream;

  final StreamController<Locale> _localeController = StreamController<Locale>();
  Stream<Locale> get currentLocale => _localeController.stream;

  void clear() {
    _languageController?.close();
    _localeController?.close();
  }

  Future<void> setNewLanguage(String newLanguage) async {
    await languageManager.setPreferredLanguage(newLanguage);
    await allTranslations.setNewLanguage(newLanguage: newLanguage).then((v) {
      _languageController.sink.add(newLanguage);
      _localeController.sink.add(allTranslations.locale);
    });
  }

}
const languageTypes={"en" :"English", "ar":"عربي" };
