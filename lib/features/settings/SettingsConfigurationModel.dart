import 'package:equatable/equatable.dart';
import 'package:rent_ready_app/features/settings/themes/AppThemes.dart';
import 'package:rent_ready_app/utilities/Fonts.dart';
import 'package:flutter/material.dart';

class SettingsConfigModel extends Equatable {
  final String lang;
  final ThemeMode themeMode;
  ThemeData _lightTheme;
  ThemeData _darkTheme;

  SettingsConfigModel({this.lang = "en", this.themeMode = ThemeMode.system}){
    _lightTheme = getLightTheme(FONTS[lang]);
    _darkTheme = getDarkTheme(FONTS[lang]);
  }

  factory SettingsConfigModel.fromJson(Map<String, dynamic> json) =>
      SettingsConfigModel(
          lang:json["lang"], themeMode:_getThemeModeFormString(json["themeMode"]));

  ThemeData get lightTheme {
    return _lightTheme;
  }

  ThemeData get darkTheme {
    return _darkTheme;
  }


  Map<String, dynamic> toJson() {
    return {"lang": lang, "themeMode": themeMode.toString()};
  }

  @override
  List<Object> get props => [lang, themeMode];
}

ThemeMode _getThemeModeFormString(String themeModeAsString) {
  return ThemeMode.values
      .where((themeMode) => themeMode.toString() == themeModeAsString).first;
}
