import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:rent_ready_app/features/splash/data/models/TokenModel.dart';
import 'package:retrofit/retrofit.dart';

part 'SplashService.g.dart';

@RestApi(baseUrl: "https://login.microsoftonline.com")
@injectable
abstract class SplashService {
  @factoryMethod
  factory SplashService(Dio dio) = _SplashService;

  @POST("/{tenantId}/oauth2/v2.0/token")
  @FormUrlEncoded()
  Future<TokenModel> getTokenData(
      {@required @Path("tenantId") String tenantId,
      @required @Field("client_id") String clientId,
      @required @Field("client_secret") String clientSecret,
      @required @Field("scope") String scope,
      @required @Field("grant_type") String grantType});
}
