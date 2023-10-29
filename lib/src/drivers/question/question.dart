import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:sylvinho/src/application/datasource/question_datasource.dart';
import 'package:sylvinho/src/application/repository/config_repository.dart';
import 'package:sylvinho/src/application/repository/question_repository.dart';
import 'package:sylvinho/src/drivers/question/question_engine.dart';

class Question {
  Question._();

  static void setup() {
    dotenv.load();

    final getIt = GetIt.instance;

    getIt.registerSingletonWithDependencies<QuestionDatasource>(
      () => QuestionEngine(),
      dependsOn: [ConfigurationRepository],
    );

    getIt.registerSingletonWithDependencies<QuestionRepository>(
          () => QuestionRepository(),
      dependsOn: [QuestionDatasource],
    );
  }
}
