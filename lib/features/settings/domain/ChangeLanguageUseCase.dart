import 'package:equatable/equatable.dart';
import 'package:rent_ready_app/core/base/domain/BaseUseCase.dart';
import 'package:rent_ready_app/features/settings/data/SettingsRepository.dart';
import 'package:injectable/injectable.dart';

import '../SettingsConfigurationModel.dart';

@injectable
class ChangeLanguageUseCase implements BaseUseCaseWithoutFailure<SettingsConfigModel, LanguageParams> {
  final SettingsRepository repository;

  ChangeLanguageUseCase(this.repository);

  @override
  Future<SettingsConfigModel> call(LanguageParams params) async {
    return await repository.changeConfigurationsLanguage(params.lang);
  }
}

class LanguageParams extends Equatable {
  final String lang;

  LanguageParams({this.lang});

  @override
  List<Object> get props => [lang];
}
