
import 'package:rent_ready_app/features/home/data/models/HomeModel.dart';

abstract class HomeRemoteDataSource {
  Future<AccountsData> getAccountsData(String query);
}
