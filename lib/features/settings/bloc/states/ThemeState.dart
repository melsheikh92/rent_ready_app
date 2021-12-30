

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../SettingsConfigurationModel.dart';

@immutable
class SettingsState extends Equatable {
  final SettingsConfigModel settingsConfigModel;

  SettingsState({
    @required this.settingsConfigModel,
  }) ;

  @override
  List<Object> get props => [settingsConfigModel];
}


class InitialState extends SettingsState{
  final SettingsConfigModel settingsConfigModel;

  InitialState({
    @required this.settingsConfigModel,
  }):super(settingsConfigModel:settingsConfigModel) ;
}