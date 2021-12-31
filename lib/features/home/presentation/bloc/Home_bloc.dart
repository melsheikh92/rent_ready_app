import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import 'package:rent_ready_app/features/home/presentation/widgets/FiltersWidget.dart';
import '../../data/models/HomeModel.dart';
import '../../domain/GetHomeDataUseCase.dart';
import './bloc.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;

  HomeBloc(this.getHomeDataUseCase) : super(InitialHomeState());

  List<UIAccountModel> allAccounts = [];
  List<UIAccountModel> filteredAccounts = [];
  UIAccountModel selectedAccount;
  List<String> allStates = [];
  Filters filters = Filters(isGrid: true);

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is LoadAccountsEvent) {
      var response = await getHomeDataUseCase.call(HomeParams());
      yield response.fold(
          (l) => FailedAccountsLoadingState("Couldn't load accounts."), (r) {
        List<UIAccountModel> list =
            r.accounts.map((e) => UIAccountModel.from(e)).toList();
        allAccounts = list;
        allStates = list.map((e) => e.address1StateOrProvince).toSet().toList();
        filteredAccounts = allAccounts;
        return AccountsLoadedState(
            accounts: filteredAccounts,
            allStates: allStates,
            selectedAccount: null,
            filters: filters);
      });
    }
    if (event is SelectAccountEvent) {
      selectedAccount = event.accountModel;
      yield AccountsLoadedState(
          accounts: filteredAccounts,
          allStates: allStates,
          selectedAccount: event.accountModel,
          filters: filters);
    }
    if (event is FilterChangedEvent) {
      filters = event.filters;
      filteredAccounts = allAccounts
          .where((element) =>
                  filters.filterValue != null
              ? element.address1StateOrProvince == filters.filterValue
              : true)
          .toList();

      filteredAccounts.removeWhere((element) {
        var name = element.name.toLowerCase();
        var searchText = (filters.searchText?? "").toLowerCase();
        return !name.contains(searchText);
      });
      selectedAccount = null;
      yield AccountsLoadedState(
          accounts: filteredAccounts,
          allStates: allStates,
          selectedAccount: selectedAccount,
          filters: filters);
    }
  }
}

// UI Model to not to use data layer model directly
class UIAccountModel extends Equatable {
  String name;
  String image;
  String address1Line1;
  String accountNumber;
  int stateCode;
  String address1StateOrProvince;
  String email;
  String website;
  String addressCity;
  dynamic revenue;
  UIAccountModel.init();
  UIAccountModel.from(AccountModel accountModel) {
    name = accountModel.name;
    image = accountModel.image;
    address1Line1 = accountModel.address1Line1;
    accountNumber = accountModel.accountNumber;
    stateCode = accountModel.stateCode;
    address1StateOrProvince = accountModel.address1StateOrProvince;
    addressCity = accountModel.address1City;
    email = accountModel.emailaddress1;
    website = accountModel.websiteurl;
    revenue = accountModel.revenue;
  }

  @override
  List<Object> get props => [
        name,
        image,
        address1Line1,
        accountNumber,
        stateCode,
        address1StateOrProvince,
        email,
        website,
        addressCity,
        revenue
      ];
}
