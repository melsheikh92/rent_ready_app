import 'package:rent_ready_app/features/splash/data/models/TokenModel.dart';

abstract class SplashRemoteDataSource {
  Future<TokenModel> getTokenData(TokenRequestModel requestModel);
}
