import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rent_ready_app/features/home/presentation/bloc/bloc.dart';
import 'package:rent_ready_app/features/home/presentation/widgets/FiltersWidget.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class LoadAccountsEvent extends HomeEvent {
  @override
  List<Object> get props => [Random().nextInt(999999)];
}

class SelectAccountEvent extends HomeEvent {
  UIAccountModel accountModel;

  SelectAccountEvent(this.accountModel);

  @override
  List<Object> get props => [accountModel];
}

class FiltersUpdatedEvent extends HomeEvent {
  Filters filters;

  FiltersUpdatedEvent(this.filters);

  @override
  List<Object> get props => [filters];
}
class FilterChangedEvent extends HomeEvent {
  Filters filters;
  FilterChangedEvent(this.filters);
  @override
 List<Object> get props => [filters];

}