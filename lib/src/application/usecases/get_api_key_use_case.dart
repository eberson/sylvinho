import 'package:get_it/get_it.dart';
import 'package:sylvinho/src/application/repository/config_repository.dart';
import 'package:sylvinho/src/enterprise/entities/config.dart';

class GetAPIKeyUseCase {

  final ConfigurationRepository _repository;

  GetAPIKeyUseCase() : _repository = GetIt.instance.get<ConfigurationRepository>();

  Future<Configuration> get() async => await _repository.getAPIKey();

}