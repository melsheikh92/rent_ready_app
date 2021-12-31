import 'dart:async';
import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';
import 'package:rent_ready_app/core/base/app/AppConfig.dart';
import 'package:rent_ready_app/features/splash/data/models/TokenModel.dart';
import '../../domain/GetTokenUseCase.dart';
import 'package:injectable/injectable.dart';
import 'package:rent_ready_app/di/InjectionContainer.dart';
import 'package:flutter_microsoft_authentication/flutter_microsoft_authentication.dart';


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

    var kClientID = "ebfcc7eb-ee76-480a-8c16-c908fe5df47f";
    var kAuthority = "https://login.microsoftonline.com/0fcd2810-9edc-41c4-be92-6c6d78468e7a";
    FlutterMicrosoftAuthentication fma = FlutterMicrosoftAuthentication(
        kClientID: kClientID,
        kAuthority: kAuthority,
        kScopes: ["User.Read", "User.ReadBasic.All"],
        androidConfigAssetPath: "assets/auth_config.json"
    );

// Sign in interactively
    String authToken = await fma.acquireTokenInteractively;

// Sign in silently
//     String authToken = await fma.acquireTokenSilently;
    Dio dio = getIt<Dio>();
    dio.options = BaseOptions(headers: {
      'Authorization': 'Bearer ${authToken}',
      'Content-Type': 'application/json',
      'charset': 'utf-8',
      'Accept': 'application/json',
      'OData-MaxVersion': 4,
      'OData-Version': 4
    });
    yield TokenLoadedState(tokenModel: TokenModel(accessToken: authToken));
/*
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
            'Content-Type': 'application/json',
            'charset': 'utf-8',
            'Accept': 'application/json',
            'OData-MaxVersion': 4,
            'OData-Version': 4
          });
          return TokenLoadedState(tokenModel: r);
        });
    yield state;
 */
  }
}
