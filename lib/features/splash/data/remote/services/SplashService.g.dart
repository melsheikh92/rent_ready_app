// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SplashService.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _SplashService implements SplashService {
  _SplashService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://login.microsoftonline.com';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<TokenModel> getTokenData(
      {tenantId, clientId, clientSecret, scope, grantType}) async {
    ArgumentError.checkNotNull(tenantId, 'tenantId');
    ArgumentError.checkNotNull(clientId, 'clientId');
    ArgumentError.checkNotNull(clientSecret, 'clientSecret');
    ArgumentError.checkNotNull(scope, 'scope');
    ArgumentError.checkNotNull(grantType, 'grantType');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = {
      'client_id': clientId,
      'client_secret': clientSecret,
      'scope': scope,
      'grant_type': grantType
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/$tenantId/oauth2/v2.0/token',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = TokenModel.fromJson(_result.data);
    return value;
  }
}
