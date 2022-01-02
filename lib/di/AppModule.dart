import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:rent_ready_app/core/base/app/AppConfig.dart';
import 'package:rent_ready_app/core/base/domain/mock_adapter.dart';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

@module
abstract class AppModule {
  @lazySingleton
  DataConnectionChecker get dataConnectionChecker => DataConnectionChecker();

  @preResolve // if you need to  pre resolve the value
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @Environment("prod")
  @lazySingleton
  Dio dioProd(SharedPreferences sharedPreferences, AppConfig appConfig) {
    final dio = Dio(BaseOptions(
        baseUrl: appConfig.getBaseUrl(),
        connectTimeout: 120000,
        receiveTimeout: 120000,
        sendTimeout: 120000,
        headers: {}));

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      // Do something before request is sent
      dio.interceptors.requestLock.lock();
      // do whatever updates in request
      dio.interceptors.requestLock.unlock();
      return options; //continue
      // If you want to resolve the request with some custom data，
      // you can return a `Response` object or return `dio.resolve(data)`.
      // If you want to reject the request with a error message,
      // you can return a `DioError` object or return `dio.reject(errMsg)`
    }, onResponse: (Response response) async {
      // Do something with response data
      print(response.toString());
      return response; // continue
    }, onError: (DioError e) async {
      print(e.toString());
      return e; //continue
    }));
    return dio;
  }

  @Environment("dev")
  @lazySingleton
  Dio get dioDev {
    final dio = Dio(BaseOptions(
        baseUrl: MockAdapter.mockBase,
        connectTimeout: 4000,
        receiveTimeout: 4000,
        sendTimeout: 4000));
    final adapter = MockAdapter();
    dio.httpClientAdapter = adapter;
    return dio;
  }
}
