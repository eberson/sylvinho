import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sylvinho/src/application/usecases/ask_question_use_case.dart';
import 'package:sylvinho/src/enterprise/entities/message.dart';

class ConversationViewModel extends ChangeNotifier {

  final AskQuestionUseCase _askQuestionUseCase = GetIt.instance.get<AskQuestionUseCase>();

  final List<Message> userMessages = [];
  final List<Message> computerMessages = [];

  late Message currentUserMessage;
  late Message currentComputerMessage;

  late Message lastResponse;

  Future<String> talk(String content) async {
    print("ask: $content");
    lastResponse = Message(
        content: await _askQuestionUseCase.ask(content),
        moment: DateTime.now()
    );

    notifyListeners();

    return lastResponse.content;
  }

  static ChangeNotifierProvider<ConversationViewModel> makeProvider() => ChangeNotifierProvider(
      create: (_) => ConversationViewModel(),
  );
}