import 'package:flutter/material.dart';

import '../../SettingsConfigurationModel.dart';

abstract class SettingsLocalDataSource {

  Future<SettingsConfigModel> getConfigurations();

  Future<SettingsConfigModel> changeConfigurationsLanguage(String lang);

  Future<SettingsConfigModel> changeConfigurationsThemeMode(ThemeMode themeMode);

}
