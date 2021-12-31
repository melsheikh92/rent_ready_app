
import 'package:flutter/material.dart';
import 'SettingsEvent.dart';



class ThemeModeChangedEvent extends SettingsEvent {
  final ThemeMode themeMode;

  ThemeModeChangedEvent({
    @required this.themeMode,
  });

  @override
  List<Object> get props => [themeMode];
}