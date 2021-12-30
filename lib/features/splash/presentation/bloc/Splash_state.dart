import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rent_ready_app/features/splash/data/models/TokenModel.dart';

@immutable
abstract class SplashState extends Equatable {}

class InitialSplashState extends SplashState {
  @override
  List<Object> get props => [];
}

class StartLoadingState extends SplashState {
  bool showLoading;
  StartLoadingState(this.showLoading);
  @override
  List<Object> get props => [showLoading];
}


class TokenLoadedState extends SplashState {
  TokenModel tokenModel;

  TokenLoadedState({@required this.tokenModel});

  @override
  List<Object> get props => [tokenModel];
}

class FailedTokenLoadedState extends SplashState {
  @override
  List<Object> get props => [Random().nextInt(999999)];
}
