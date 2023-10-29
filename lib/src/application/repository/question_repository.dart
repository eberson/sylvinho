import 'package:get_it/get_it.dart';
import 'package:sylvinho/src/application/datasource/question_datasource.dart';
import 'package:sylvinho/src/enterprise/entities/chat_event.dart';

class QuestionRepository {
  final QuestionDatasource _datasource;

  QuestionRepository(): _datasource = GetIt.instance.get<QuestionDatasource>();

  Future<ChatEvent> askQuestion(String question) async {
    return await _datasource.askQuestion(question);
  }
}