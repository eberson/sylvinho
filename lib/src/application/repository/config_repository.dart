import 'package:get_it/get_it.dart';
import 'package:sylvinho/src/application/datasource/config_datasource.dart';
import 'package:sylvinho/src/enterprise/entities/config.dart';

class ConfigurationRepository {

  final ConfigurationDatasource _datasource;

  ConfigurationRepository() : _datasource = GetIt.instance.get<ConfigurationDatasource>();

  Future<Configuration> getAPIKey() async => Configuration(apiKey: await _datasource.getAPIKey());

  Future<void> updateAPIKey(String apiKey) => _datasource.updateAPIKey(apiKey);
}