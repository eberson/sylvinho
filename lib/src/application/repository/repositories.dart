import 'package:get_it/get_it.dart';
import 'package:sylvinho/src/application/datasource/config_datasource.dart';
import 'package:sylvinho/src/application/datasource/question_datasource.dart';
import 'package:sylvinho/src/application/repository/config_repository.dart';
import 'package:sylvinho/src/application/repository/question_repository.dart';

class Repositories {
  Repositories._();

  static void setup() {
    final getIt = GetIt.instance;

    getIt.registerSingletonWithDependencies<ConfigurationRepository>(
      () => ConfigurationRepository(),
      dependsOn: [ConfigurationDatasource],
    );

    getIt.registerSingletonWithDependencies<QuestionRepository>(
      () => QuestionRepository(),
      dependsOn: [QuestionDatasource],
    );
  }
}
