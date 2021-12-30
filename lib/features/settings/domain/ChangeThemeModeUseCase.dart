import 'package:equatable/equatable.dart';
import 'package:rent_ready_app/core/base/domain/BaseUseCase.dart';
import 'package:rent_ready_app/features/settings/data/SettingsRepository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../SettingsConfigurationModel.dart';

@injectable
class ChangeThemeUseCase implements BaseUseCaseWithoutFailure<SettingsConfigModel, ThemeParams> {
  final SettingsRepository repository;

  ChangeThemeUseCase(this.repository);

  @override
  Future<SettingsConfigModel> call(ThemeParams params) async {
    return await repository.changeConfigurationsThemeMode(params.themeMode);
  }
}

class ThemeParams extends Equatable {
  final ThemeMode themeMode;

  ThemeParams({this.themeMode});

  @override
  List<Object> get props => [themeMode];
}