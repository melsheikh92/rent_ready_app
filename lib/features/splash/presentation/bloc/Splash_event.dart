import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SplashEvent extends Equatable {}

class LoadTokenEvent extends SplashEvent {
  @override
  List<Object> get props => [Random().nextInt(999999)];
}
