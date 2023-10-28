import 'package:get_it/get_it.dart';
import 'package:sylvinho/src/application/repository/question_repository.dart';

class AskQuestionUseCase {
  final QuestionRepository _repository;

  AskQuestionUseCase(): _repository = GetIt.instance.get<QuestionRepository>();

  Future<String> ask(String question) async => await _repository.askQuestion(question);
}