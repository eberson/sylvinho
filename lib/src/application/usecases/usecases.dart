import 'package:get_it/get_it.dart';
import 'package:sylvinho/src/application/repository/config_repository.dart';
import 'package:sylvinho/src/application/repository/question_repository.dart';
import 'package:sylvinho/src/application/usecases/ask_question_use_case.dart';
import 'package:sylvinho/src/application/usecases/get_api_key_use_case.dart';
import 'package:sylvinho/src/application/usecases/update_api_key_use_case.dart';

class UseCases {
  UseCases._();

  static void setup() {
    final getIt = GetIt.instance;

    getIt.registerSingletonWithDependencies<GetAPIKeyUseCase>(
      () => GetAPIKeyUseCase(),
      dependsOn: [ConfigurationRepository],
    );

    getIt.registerSingletonWithDependencies<UpdateAPIKeyUseCase>(
      () => UpdateAPIKeyUseCase(),
      dependsOn: [ConfigurationRepository],
    );

    getIt.registerSingletonWithDependencies<AskQuestionUseCase>(
      () => AskQuestionUseCase(),
      dependsOn: [QuestionRepository],
    );
  }
}
