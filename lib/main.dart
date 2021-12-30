import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_ready_app/features/settings/bloc/events/SettingsEvent.dart';
import 'package:rent_ready_app/features/settings/bloc/states/ThemeState.dart';
import 'package:rent_ready_app/utilities/navigator_key.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/base/app/ConfigReader.dart';
import 'core/language/GlobalTranslations.dart';
import 'di/InjectionContainer.dart';
import 'features/settings/bloc/SettingsConfigBloc.dart';
import 'di/InjectionContainer.dart' as di;
import 'features/splash/presentation/screens/SplashScreen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(BlocProvider(
    create: (_) => getIt<SettingsConfigBloc>()..add(SettingsEvent()),
    child: MyApp(),
  ));
}

Future initialize() async {
  await ConfigReader.initialize();
  await di.configure(environment: "dev");
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsConfigBloc, SettingsState>(
      builder: _buildThemeBuilder,
    );
  }
  Widget _buildThemeBuilder(BuildContext context, SettingsState state) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: state.settingsConfigModel.lightTheme,
      darkTheme: state.settingsConfigModel.darkTheme,
      themeMode: state.settingsConfigModel.themeMode,
      title: 'Rent Ready',
      debugShowCheckedModeBanner: false,
      locale: Locale(state.settingsConfigModel.lang) ?? allTranslations.locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      supportedLocales: allTranslations.supportedLocales(),
      home: SplashScreen(),
    );
  }
}

enum BuildEnvironment { dev, prod }
