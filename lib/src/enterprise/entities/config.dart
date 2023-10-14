class Configuration {
  final String apiKey;

  Configuration({
    required this.apiKey,
  });

  bool get isValid => apiKey.isNotEmpty;
  bool get isNotValid => !isValid;
}
