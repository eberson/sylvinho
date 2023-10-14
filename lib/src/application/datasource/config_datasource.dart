abstract class ConfigurationDatasource {
  Future<String> getAPIKey();
  Future<void> updateAPIKey(String apiKey);
}