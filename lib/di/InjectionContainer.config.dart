// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data_connection_checker/data_connection_checker.dart' as _i3;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../core/base/app/AppConfig.dart' as _i23;
import '../core/platform/NetworkInfo.dart' as _i6;
import '../core/platform/NetworkInfoImpl.dart' as _i7;
import '../features/home/data/remote/services/HomeService.dart' as _i5;
import '../features/home/data/remote/source/HomeRemoteDataSource.dart' as _i10;
import '../features/home/data/remote/source/HomeRemoteDataSourceImpl.dart'
    as _i11;
import '../features/home/data/repository/HomeRepository.dart' as _i12;
import '../features/home/data/repository/HomeRepositoryImpl.dart' as _i13;
import '../features/home/domain/GetHomeDataUseCase.dart' as _i26;
import '../features/home/presentation/bloc/Home_bloc.dart' as _i29;
import '../features/settings/bloc/SettingsConfigBloc.dart' as _i30;
import '../features/settings/data/local/SettingsLocalDataSource.dart' as _i15;
import '../features/settings/data/local/SettingsLocalDataSourceImpl.dart'
    as _i16;
import '../features/settings/data/SettingsRepository.dart' as _i17;
import '../features/settings/data/SettingsRepositoryImpl.dart' as _i18;
import '../features/settings/domain/ChangeLanguageUseCase.dart' as _i24;
import '../features/settings/domain/ChangeThemeModeUseCase.dart' as _i25;
import '../features/settings/domain/GetSettingsConfigUseCase.dart' as _i27;
import '../features/splash/data/remote/services/SplashService.dart' as _i9;
import '../features/splash/data/remote/source/SplashRemoteDataSource.dart'
    as _i19;
import '../features/splash/data/remote/source/SplashRemoteDataSourceImpl.dart'
    as _i20;
import '../features/splash/data/repository/SplashRepository.dart' as _i21;
import '../features/splash/data/repository/SplashRepositoryImpl.dart' as _i22;
import '../features/splash/domain/GetTokenUseCase.dart' as _i28;
import '../features/splash/presentation/bloc/Splash_bloc.dart' as _i31;
import '../utilities/language_manager.dart' as _i14;
import 'AppModule.dart' as _i32;

const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.DataConnectionChecker>(
      () => appModule.dataConnectionChecker);
  gh.lazySingleton<_i4.Dio>(() => appModule.dioDev, registerFor: {_dev});
  gh.factory<_i5.HomeService>(() => _i5.HomeService(get<_i4.Dio>()));
  gh.factory<_i6.NetworkInfo>(
      () => _i7.NetworkInfoImpl(get<_i3.DataConnectionChecker>()));
  await gh.factoryAsync<_i8.SharedPreferences>(() => appModule.prefs,
      preResolve: true);
  gh.factory<_i9.SplashService>(() => _i9.SplashService(get<_i4.Dio>()));
  gh.factory<_i10.HomeRemoteDataSource>(
      () => _i11.HomeRemoteDataSourceImpl(get<_i5.HomeService>()));
  gh.factory<_i12.HomeRepository>(
      () => _i13.HomeRepositoryImpl(get<_i10.HomeRemoteDataSource>()));
  gh.lazySingleton<_i14.LanguageManager>(
      () => _i14.LanguageManager(get<_i8.SharedPreferences>()));
  gh.factory<_i15.SettingsLocalDataSource>(
      () => _i16.SettingsLocalDataSourceImpl(get<_i8.SharedPreferences>()));
  gh.factory<_i17.SettingsRepository>(
      () => _i18.SettingsRepositoryImpl(get<_i15.SettingsLocalDataSource>()));
  gh.factory<_i19.SplashRemoteDataSource>(
      () => _i20.SplashRemoteDataSourceImpl(get<_i9.SplashService>()));
  gh.factory<_i21.SplashRepository>(
      () => _i22.SplashRepositoryImpl(get<_i19.SplashRemoteDataSource>()));
  gh.lazySingleton<_i23.AppConfig>(
      () => _i23.AppConfig(get<_i14.LanguageManager>()));
  gh.factory<_i24.ChangeLanguageUseCase>(
      () => _i24.ChangeLanguageUseCase(get<_i17.SettingsRepository>()));
  gh.factory<_i25.ChangeThemeUseCase>(
      () => _i25.ChangeThemeUseCase(get<_i17.SettingsRepository>()));
  gh.lazySingleton<_i4.Dio>(
      () => appModule.dioProd(
          get<_i8.SharedPreferences>(), get<_i23.AppConfig>()),
      registerFor: {_prod});
  gh.factory<_i26.GetHomeDataUseCase>(
      () => _i26.GetHomeDataUseCase(get<_i12.HomeRepository>()));
  gh.factory<_i27.GetSettingsConfigUseCase>(
      () => _i27.GetSettingsConfigUseCase(get<_i17.SettingsRepository>()));
  gh.factory<_i28.GetTokenUseCase>(
      () => _i28.GetTokenUseCase(get<_i21.SplashRepository>()));
  gh.factory<_i29.HomeBloc>(
      () => _i29.HomeBloc(get<_i26.GetHomeDataUseCase>()));
  gh.factory<_i30.SettingsConfigBloc>(() => _i30.SettingsConfigBloc(
      get<_i27.GetSettingsConfigUseCase>(),
      get<_i24.ChangeLanguageUseCase>(),
      get<_i25.ChangeThemeUseCase>()));
  gh.factory<_i31.SplashBloc>(
      () => _i31.SplashBloc(get<_i28.GetTokenUseCase>()));
  return get;
}

class _$AppModule extends _i32.AppModule {}
