import 'package:get_it/get_it.dart';
import 'package:sylvinho/src/application/repository/question_repository.dart';
import 'package:sylvinho/src/enterprise/entities/chat_event.dart';

class AskQuestionUseCase {
  final QuestionRepository _repository;

  AskQuestionUseCase(): _repository = GetIt.instance.get<QuestionRepository>();

  Future<ChatEvent> ask(String question) async => await _repository.askQuestion(question);
}