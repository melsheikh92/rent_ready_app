import 'dart:async';
import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:rent_ready_app/core/base/app/AppConfig.dart';
import 'package:rent_ready_app/features/splash/data/models/TokenModel.dart';
import '../../domain/GetTokenUseCase.dart';
import 'package:injectable/injectable.dart';
import 'package:rent_ready_app/di/InjectionContainer.dart';

import 'bloc.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetTokenUseCase getSplashDataUseCase;

  SplashBloc(this.getSplashDataUseCase) : super(InitialSplashState());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event,) async* {
    if (event is LoadTokenEvent) {
      yield* loadToken();
    }
  }
  Stream<SplashState> loadToken() async* {
    yield StartLoadingState(true);
    AppConfig config = getIt<AppConfig>();
    TokenRequestModel tokenRequestModel = TokenRequestModel(
        tenantId: config.getTenantId(),
        scope: config.getScope(),
        grantType: config.getGrantType(),
        clientSecret: config.getClientSecret(),
        clientId: config.getClientId());
    var state = (await getSplashDataUseCase
        .call(SplashParams(requestModel: tokenRequestModel)))
        .fold((l) => FailedTokenLoadedState(),
            (r) {
          Dio dio = getIt<Dio>();
          dio.options = BaseOptions(headers: {
            'Authorization': 'Bearer ${r.accessToken}',
            'charset': 'utf-8',
            'Accept': '*/*',
            'Accept-Encoding': 'gzip, deflate, br',
            'Connection': 'keep-alive',
          });
          return TokenLoadedState(tokenModel: r);
        });

    yield state;
  }
}
