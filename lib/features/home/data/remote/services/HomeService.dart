import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:rent_ready_app/features/home/data/models/HomeModel.dart';
import 'package:retrofit/retrofit.dart';

part 'HomeService.g.dart';

@RestApi(baseUrl: "https://org2c9fce96.api.crm4.dynamics.com/api/data/v9.2")
@injectable
abstract class HomeService {
  @factoryMethod
  factory HomeService(Dio dio) = _HomeService;

  @GET("/accounts{query}")
  Future<AccountsData> getAccounts(@Path("query") String query);
}
