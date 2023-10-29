import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sylvinho/src/application/usecases/ask_question_use_case.dart';
import 'package:sylvinho/src/enterprise/entities/assistant_message.dart';
import 'package:sylvinho/src/enterprise/entities/message.dart';
import 'package:sylvinho/src/enterprise/entities/user_message.dart';

class ConversationViewModel extends ChangeNotifier {

  final AskQuestionUseCase _askQuestionUseCase = GetIt.instance.get<AskQuestionUseCase>();

  final List<Message> messages = [];

  late Message lastUserMessage;
  late Message lastAssistantMessage;

  bool shouldDoLecture = false;

  void doLecture() {
    shouldDoLecture = true;
  }

  void doneLecture() {
    shouldDoLecture = false;
  }

  Future<String> talk(String content) async {
    _storeUserMessage(content);
    final response = await _callAssistant(content);

    return response.content;
  }

  void _storeUserMessage(String content) {
    final message = UserMessage.fromContent(content);

    messages.add(message);
    lastUserMessage = message;

    notifyListeners();
  }

  Future<AssistantMessage> _callAssistant(String content) async {
    final response = await _askQuestionUseCase.ask(content);

    print(response.message);

    final message = AssistantMessage.fromContent(response.message);

    messages.add(message);
    lastAssistantMessage = message;

    notifyListeners();

    return message;
  }

  static ChangeNotifierProvider<ConversationViewModel> makeProvider() => ChangeNotifierProvider(
      create: (_) => ConversationViewModel(),
  );
}