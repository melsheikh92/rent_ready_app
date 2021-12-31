import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rent_ready_app/features/home/data/models/HomeModel.dart';
import 'package:rent_ready_app/features/home/data/repository/HomeRepository.dart';
import 'package:rent_ready_app/features/home/domain/GetHomeDataUseCase.dart';
import 'package:rent_ready_app/features/home/presentation/bloc/bloc.dart';
import 'package:rent_ready_app/features/home/presentation/widgets/FiltersWidget.dart';

class HomeMockRepository extends Mock implements HomeRepository {}

void main() {
  HomeMockRepository repository = HomeMockRepository();

  var homeData = AccountsData(accounts: [
    AccountModel(name: "", stateCode: 6, address1StateOrProvince: "")
  ]);

  var useCase = GetHomeDataUseCase(repository);

  blocTest("Home bloc test", build: () {
    when(repository.getAccountsData(any))
        .thenAnswer((_) async => right(homeData));

    var bloc = HomeBloc(useCase);
    bloc.add(LoadAccountsEvent());

    expectLater(
      bloc,
      emitsInOrder([
        InitialHomeState(),
        AccountsLoadedState(
            accounts:
                homeData.accounts.map((e) => UIAccountModel.from(e)).toList(),
            allStates: homeData.accounts.map((e) => e.address1StateOrProvince).toList(),
            filters: Filters(isGrid: true),
            selectedAccount: null),
      ]),
    );
  });
}
