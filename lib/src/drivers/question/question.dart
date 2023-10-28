import 'package:get_it/get_it.dart';
import 'package:sylvinho/src/application/datasource/question_datasource.dart';
import 'package:sylvinho/src/drivers/question/question_engine.dart';

class Question {

  Question._();

  static void setup() {
    final getIt = GetIt.instance;

    getIt.registerSingletonAsync<QuestionDatasource>(() => Future.value(QuestionEngine()));
  }

}