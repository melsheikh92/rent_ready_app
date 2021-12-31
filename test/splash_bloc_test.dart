import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rent_ready_app/features/splash/data/models/TokenModel.dart';
import 'package:rent_ready_app/features/splash/data/repository/SplashRepository.dart';
import 'package:rent_ready_app/features/splash/domain/GetTokenUseCase.dart';
import 'package:rent_ready_app/features/splash/presentation/bloc/bloc.dart';

class SplashMockRepository extends Mock implements SplashRepository {}

void main() {

  SplashMockRepository repository = SplashMockRepository();

  var tokenModel = TokenModel(
      accessToken: "token",
      expiresIn: 2222,
      tokenType: "Bearer",
      extExpiresIn: 333);

  var useCase = GetTokenUseCase(repository);

  blocTest("Splash bloc test", build: () {

    when(repository.getTokenData(any))
        .thenAnswer((_) async => right(tokenModel));

    var bloc = SplashBloc(useCase);
    bloc.add(LoadTokenEvent());

    expectLater(
      bloc,
      emitsInOrder([
        InitialSplashState(),
        StartLoadingState(true),
        TokenLoadedState(tokenModel: tokenModel),
      ]),
    );
  });
}
