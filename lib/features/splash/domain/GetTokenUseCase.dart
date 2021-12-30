import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:rent_ready_app/core/base/data/error/ResponseError.dart';
import 'package:rent_ready_app/core/base/domain/BaseUseCase.dart';
import '../data/models/TokenModel.dart';
import '../data/repository/SplashRepository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTokenUseCase implements BaseUseCase<TokenModel, SplashParams> {
  final SplashRepository repository;

  const GetTokenUseCase(this.repository);

  @override
  Future<Either<ResponseError, TokenModel>> call(SplashParams params) {
    return repository.getTokenData(params.requestModel);
  }
}

class SplashParams extends Equatable {
  TokenRequestModel requestModel;
  SplashParams({@required this.requestModel});
  @override List<Object> get props => [requestModel];
}
