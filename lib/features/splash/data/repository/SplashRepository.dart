
import 'package:dartz/dartz.dart';
import 'package:rent_ready_app/core/base/data/error/ResponseError.dart';
import 'package:rent_ready_app/features/splash/data/models/TokenModel.dart';

abstract class SplashRepository{
  Future<Either<ResponseError, TokenModel>> getTokenData(TokenRequestModel requestModel);

}