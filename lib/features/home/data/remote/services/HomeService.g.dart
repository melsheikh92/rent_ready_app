// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeService.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _HomeService implements HomeService {
  _HomeService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://org2c9fce96.api.crm4.dynamics.com/api/data/v9.2';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<AccountsData> getAccounts(query) async {
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/accounts$query',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AccountsData.fromJson(_result.data);
    return value;
  }
}
