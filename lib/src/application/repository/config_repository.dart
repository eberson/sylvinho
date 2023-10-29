import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:sylvinho/src/application/datasource/config_datasource.dart';
import 'package:sylvinho/src/enterprise/entities/config.dart';

class ConfigurationRepository {

  final ConfigurationDatasource _datasource;

  ConfigurationRepository() : _datasource = GetIt.instance.get<ConfigurationDatasource>();

  Future<Configuration> getAPIKey() async {
    var key = await _datasource.getAPIKey();

    if (key.isEmpty) {
      key = dotenv.env['token'] ?? "";

      if (key.isNotEmpty) {
        _datasource.updateAPIKey(key);
      }
    }

    return Configuration(apiKey: key);
  }

  Future<void> updateAPIKey(String apiKey) => _datasource.updateAPIKey(apiKey);
}