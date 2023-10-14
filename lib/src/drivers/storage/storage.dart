import 'package:get_it/get_it.dart';
import 'package:sylvinho/src/application/datasource/config_datasource.dart';
import 'package:sylvinho/src/drivers/storage/config_storage.dart';

class Storage {
  
  Storage._();
  
  static void setup() {
    final getIt = GetIt.instance;
    
    getIt.registerSingletonAsync<ConfigurationDatasource>(() => Future.value(ConfigurationStorage()));
  }
  
}