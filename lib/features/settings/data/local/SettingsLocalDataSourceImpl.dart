import 'dart:convert';

import 'package:rent_ready_app/core/contstants/SharedPreferenceConstants.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../SettingsConfigurationModel.dart';
import 'SettingsLocalDataSource.dart';

@Injectable(as: SettingsLocalDataSource)
@injectable
class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final SharedPreferences sharedPreferences;

  SettingsLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<SettingsConfigModel> getConfigurations() {
    final jsonString = sharedPreferences.getString(SETTINGS_CACHED_DATA);
    if (jsonString != null) {
      return Future.value(
          SettingsConfigModel.fromJson(json.decode(jsonString)));
    } else {
      return Future.value(SettingsConfigModel());
    }
  }

  @override
  Future<SettingsConfigModel> changeConfigurationsLanguage(String lang) async {
    final jsonString = sharedPreferences.getString(SETTINGS_CACHED_DATA);

    if (jsonString != null) {
      final settingModel =
          SettingsConfigModel.fromJson(json.decode(jsonString));
      if (lang == settingModel.lang) {
        return Future.value(settingModel);
      } else {
        return saveAndPrepareSettingModel(lang, settingModel.themeMode);
      }
    } else {
      return saveAndPrepareSettingModel(lang, ThemeMode.system);
    }
  }

  Future<SettingsConfigModel> saveAndPrepareSettingModel(
      String lang, ThemeMode themeMode) async {
    final settingsModel = SettingsConfigModel(lang: lang, themeMode: themeMode);
    final jsonToSave = json.encode(settingsModel.toJson());
    await sharedPreferences.setString(SETTINGS_CACHED_DATA, jsonToSave);
    return settingsModel;
  }

  @override
  Future<SettingsConfigModel> changeConfigurationsThemeMode(
      ThemeMode themeMode) {
    final jsonString = sharedPreferences.getString(SETTINGS_CACHED_DATA);

    if (jsonString != null) {
      final settingModel =
          SettingsConfigModel.fromJson(json.decode(jsonString));
      if (themeMode == settingModel.themeMode) {
        return Future.value(settingModel);
      } else {
        return saveAndPrepareSettingModel(settingModel.lang, themeMode);
      }
    } else {
      return saveAndPrepareSettingModel("en", themeMode);
    }
  }
}
