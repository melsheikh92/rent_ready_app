import 'package:equatable/equatable.dart';
import 'package:rent_ready_app/core/base/domain/BaseUseCase.dart';
import 'package:rent_ready_app/features/settings/data/SettingsRepository.dart';
import 'package:injectable/injectable.dart';

import '../SettingsConfigurationModel.dart';


@injectable
class GetSettingsConfigUseCase implements BaseUseCaseWithoutFailure<SettingsConfigModel, SettingsParams> {
  final SettingsRepository repository;

  GetSettingsConfigUseCase(this.repository);

  @override
  Future<SettingsConfigModel> call(SettingsParams params) async {
    return await repository.getConfigurations();
  }
}

class SettingsParams extends Equatable {
  @override
  List<Object> get props => [];
}