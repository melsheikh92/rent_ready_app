import 'package:flutter/src/material/app.dart';
import 'package:injectable/injectable.dart';

import '../SettingsConfigurationModel.dart';
import 'SettingsRepository.dart';
import 'local/SettingsLocalDataSource.dart';

@Injectable(as: SettingsRepository)
@injectable
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource settingsLocalDataSource;

  SettingsRepositoryImpl(this.settingsLocalDataSource);

  @override
  Future<SettingsConfigModel> changeConfigurationsLanguage(String lang) async {
    try {
      return settingsLocalDataSource.changeConfigurationsLanguage(lang);
    } on Exception{
      return Future.value(SettingsConfigModel());
    }
  }

  @override
  Future<SettingsConfigModel> changeConfigurationsThemeMode(
      ThemeMode themeMode) {
    try {
      return settingsLocalDataSource.changeConfigurationsThemeMode(themeMode);
    } on Exception{
      return Future.value(SettingsConfigModel());
    }
  }

  @override
  Future<SettingsConfigModel> getConfigurations() {
    try {
      return settingsLocalDataSource.getConfigurations();
    } on Exception{
      return Future.value(SettingsConfigModel());
    }
  }
}
