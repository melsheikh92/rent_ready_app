import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rent_ready_app/features/home/presentation/widgets/FiltersWidget.dart';
import 'Home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class InitialHomeState extends HomeState {
  @override
  List<Object> get props => [];
}

class AccountsLoadedState extends HomeState {
  final _id = Random().nextInt(9999999);
  List<UIAccountModel> accounts;
  List<String> allStates;
  UIAccountModel selectedAccount;
  Filters filters;
  AccountsLoadedState({this.accounts, this.allStates, this.selectedAccount, this.filters});

  @override
  List<Object> get props => [accounts, selectedAccount, filters, allStates, _id];
}

class FailedAccountsLoadingState extends HomeState {
  String message;

  FailedAccountsLoadingState(this.message);

  @override
  List<Object> get props => [message];
}


