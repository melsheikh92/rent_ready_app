
import 'package:dartz/dartz.dart';
import 'package:rent_ready_app/core/base/data/error/ResponseError.dart';
import 'package:rent_ready_app/features/home/data/models/HomeModel.dart';

abstract class HomeRepository{
  Future<Either<ResponseError, AccountsData>> getAccountsData(String query);

}