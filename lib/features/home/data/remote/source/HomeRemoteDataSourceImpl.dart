import 'package:injectable/injectable.dart';
import 'package:rent_ready_app/features/home/data/models/HomeModel.dart';
import '../services/HomeService.dart';
import 'HomeRemoteDataSource.dart';

@Injectable(as:HomeRemoteDataSource)
@injectable
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final HomeService _service;

  const HomeRemoteDataSourceImpl(this._service);

  @override
  Future<AccountsData> getAccountsData(String query) {
    return _service.getAccounts(query);
  }
}
