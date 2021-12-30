import 'package:rent_ready_app/features/splash/data/models/TokenModel.dart';

import '../services/SplashService.dart';
import 'package:injectable/injectable.dart';

import 'SplashRemoteDataSource.dart';

@Injectable(as: SplashRemoteDataSource)
@injectable
class SplashRemoteDataSourceImpl implements SplashRemoteDataSource {
  final SplashService _service;

  const SplashRemoteDataSourceImpl(this._service);

  @override
  Future<TokenModel> getTokenData(TokenRequestModel requestModel) {
    return _service.getTokenData(
        tenantId: requestModel.tenantId,
        clientId: requestModel.clientId,
        clientSecret: requestModel.clientSecret,
        grantType: requestModel.grantType,
        scope: requestModel.scope);
  }
}
