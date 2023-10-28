import 'package:sylvinho/src/application/datasource/question_datasource.dart';

class QuestionEngine implements QuestionDatasource {
  @override
  Future<String> askQuestion(String question) {
    return Future.value("Não entendi o que você falou");
  }

}