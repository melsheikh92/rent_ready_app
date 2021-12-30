import 'package:dartz/dartz.dart';
import 'package:rent_ready_app/core/base/data/error/Exceptions.dart';
import 'package:rent_ready_app/core/base/data/error/ResponseError.dart';
import 'package:rent_ready_app/features/splash/data/models/TokenModel.dart';
import 'package:rent_ready_app/resources/strings_generated.dart';

import '../remote/source/SplashRemoteDataSource.dart';
import 'package:injectable/injectable.dart';

import 'SplashRepository.dart';

@Injectable(as:SplashRepository)
@injectable
class SplashRepositoryImpl implements SplashRepository {

  final SplashRemoteDataSource remoteDataSource;

  const SplashRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<ResponseError, TokenModel>> getTokenData(TokenRequestModel requestModel) async {
    try {
      final response = await remoteDataSource.getTokenData(requestModel);
      return right(response);
    } on Exception catch (error) {
      return left(
          ServerFailure(statusCode: "", message: AppStrings.defaulterrormessage));
    }
  }
}
