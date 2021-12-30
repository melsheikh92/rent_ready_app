import 'package:dartz/dartz.dart';
import 'package:rent_ready_app/core/base/data/error/Exceptions.dart';
import 'package:rent_ready_app/core/base/data/error/ResponseError.dart';
import 'package:rent_ready_app/features/home/data/models/HomeModel.dart';

import '../remote/source/HomeRemoteDataSource.dart';
import 'package:injectable/injectable.dart';

import 'HomeRepository.dart';

@Injectable(as:HomeRepository)
@injectable
class HomeRepositoryImpl implements HomeRepository {

  final HomeRemoteDataSource remoteDataSource;

  const HomeRepositoryImpl(this.remoteDataSource);
  @override Future<Either<ResponseError, AccountsData>> getAccountsData(String query) async {
    try {
      final response =
      await remoteDataSource.getAccountsData(query);
      return right(response);
    } on ServerException catch (error) {
      return left(
          ServerFailure(statusCode: error.statusCode, message: error.message));
    }
  }
}
