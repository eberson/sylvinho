import 'package:localstorage/localstorage.dart';
import 'package:sylvinho/src/application/datasource/config_datasource.dart';

class ConfigurationStorage implements ConfigurationDatasource {
  final LocalStorage storage = LocalStorage("config.json");

  @override
  Future<String> getAPIKey() async {
    await storage.ready;
    return (storage.getItem("apiKey") ?? "") as String;
  }

  @override
  Future<void> updateAPIKey(String apiKey) async {
    await storage.ready;
    storage.setItem("apiKey", apiKey);
  }
}