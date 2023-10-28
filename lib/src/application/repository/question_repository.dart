import 'package:get_it/get_it.dart';
import 'package:sylvinho/src/application/datasource/question_datasource.dart';

class QuestionRepository {
  final QuestionDatasource _datasource;

  QuestionRepository(): _datasource = GetIt.instance.get<QuestionDatasource>();

  Future<String> askQuestion(String question) async {
    return await _datasource.askQuestion(question);
  }
}