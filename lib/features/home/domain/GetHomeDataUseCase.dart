import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:equatable/equatable.dart';
import 'package:rent_ready_app/core/base/data/error/ResponseError.dart';
import 'package:rent_ready_app/core/base/domain/BaseUseCase.dart';
import 'package:rent_ready_app/features/home/data/models/HomeModel.dart';
import '../data/repository/HomeRepository.dart';


@injectable
class GetHomeDataUseCase implements BaseUseCase<AccountsData, HomeParams> {
  final HomeRepository repository;

  const GetHomeDataUseCase(this.repository);

  @override
  Future<Either<ResponseError, AccountsData>> call(HomeParams params) {
    return repository.getAccountsData("");
  }
}

class HomeParams extends Equatable {
  @override
  List<Object> get props => [];
}
