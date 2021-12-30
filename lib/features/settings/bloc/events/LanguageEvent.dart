

import 'package:flutter/foundation.dart';

import 'SettingsEvent.dart';

class LanguageChangedEvent extends SettingsEvent {
  final String lang;

  LanguageChangedEvent({
    @required this.lang,
  });

  @override
  List<Object> get props => [lang];
}