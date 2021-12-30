import 'package:rent_ready_app/core/language/GlobalTranslations.dart';
import 'package:rent_ready_app/features/settings/bloc/states/ThemeState.dart';
import 'package:rent_ready_app/features/settings/domain/ChangeLanguageUseCase.dart';
import 'package:rent_ready_app/features/settings/domain/ChangeThemeModeUseCase.dart';
import 'package:rent_ready_app/features/settings/domain/GetSettingsConfigUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../SettingsConfigurationModel.dart';
import 'events/LanguageEvent.dart';
import 'events/SettingsEvent.dart';
import 'events/ThemeEvent.dart';


@injectable
class SettingsConfigBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetSettingsConfigUseCase getSettingsConfigUseCase;
  final ChangeLanguageUseCase changeLanguageUseCase;
  final ChangeThemeUseCase changeThemeUseCase;

  SettingsConfigBloc(this.getSettingsConfigUseCase, this.changeLanguageUseCase,
      this.changeThemeUseCase) : super(InitialState(settingsConfigModel: SettingsConfigModel()));


  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is ThemeModeChangedEvent) {
      final themeSettingsModel = await changeThemeUseCase
          .call(ThemeParams(themeMode: event.themeMode));
      yield SettingsState(settingsConfigModel: themeSettingsModel);
    } else if (event is LanguageChangedEvent) {
      final languageSettingsModel =
          await changeLanguageUseCase.call(LanguageParams(lang: event.lang));
      await allTranslations.setNewLanguage(newLanguage: languageSettingsModel.lang);
      yield SettingsState(settingsConfigModel: languageSettingsModel);
    } else {
      final settingsConfigModel =
      await getSettingsConfigUseCase.call(SettingsParams());
      await allTranslations.setNewLanguage(newLanguage: settingsConfigModel.lang);
      yield SettingsState(settingsConfigModel: settingsConfigModel);
    }
  }
}
