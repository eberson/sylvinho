import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sylvinho/src/application/usecases/get_api_key_use_case.dart';
import 'package:sylvinho/src/application/usecases/update_api_key_use_case.dart';
import 'package:sylvinho/src/enterprise/entities/config.dart';

class ConfigurationViewModel extends ChangeNotifier {
  Configuration? _configuration;

  final GetAPIKeyUseCase _getAPIKeyUseCase = GetIt.instance.get<GetAPIKeyUseCase>();
  final UpdateAPIKeyUseCase _updateAPIKeyUseCase = GetIt.instance.get<UpdateAPIKeyUseCase>();

  Future<void> loadAPIKey() async {
    _configuration ??= await _getAPIKeyUseCase.get();
    notifyListeners();
  }

  Future<void> updateAPIKey(String apiKey) async {
    _configuration = await _updateAPIKeyUseCase.update(apiKey);
    notifyListeners();
  }

  Configuration? get configuration => _configuration;

  static ChangeNotifierProvider<ConfigurationViewModel> makeProvider() {
    return ChangeNotifierProvider(create: (_){
      final vm = ConfigurationViewModel();
      vm.loadAPIKey();

      return vm;
    });
  }
}
