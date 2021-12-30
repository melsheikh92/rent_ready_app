import 'package:dartz/dartz.dart';
import 'package:rent_ready_app/core/base/data/error/ResponseError.dart';
/*
* a base useCase class that has only one method for executing
*
*   Type -> Indicate to the Response data type
*    Params -> Indicate  to which Paramters you want to pass to your method
*
* */

abstract class BaseUseCase <Type, Params> {
  Future<Either<ResponseError, Type>> call(Params params);
}


abstract class BaseUseCaseWithoutFailure <Type, Params> {
  Future<Type> call(Params params);
}
