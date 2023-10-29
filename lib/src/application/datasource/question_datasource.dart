import 'package:sylvinho/src/enterprise/entities/chat_event.dart';

abstract class QuestionDatasource {
  Future<ChatEvent> askQuestion(String question);
}