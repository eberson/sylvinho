import 'package:get_it/get_it.dart';
import 'package:sylvinho/src/application/repository/config_repository.dart';
import 'package:sylvinho/src/enterprise/entities/config.dart';

class UpdateAPIKeyUseCase {

  final ConfigurationRepository _repository;

  UpdateAPIKeyUseCase() : _repository = GetIt.instance.get<ConfigurationRepository>();

  Future<Configuration> update(String apiKey) async {
    final configuration = Configuration(apiKey: apiKey);
    await _repository.updateAPIKey(configuration.apiKey);

    return configuration;
  }

}