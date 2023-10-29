import 'dart:developer';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:get_it/get_it.dart';
import 'package:sylvinho/src/application/datasource/question_datasource.dart';
import 'package:sylvinho/src/application/repository/config_repository.dart';
import 'package:sylvinho/src/enterprise/entities/chat_event.dart';

class QuestionEngine implements QuestionDatasource {
  final ConfigurationRepository _repository;

  OpenAI? _openAI;
  String _lastUsedKey = "";

  QuestionEngine() : _repository = GetIt.instance.get<ConfigurationRepository>();

  // @override
  // Future<ChatEvent> askQuestion(String question) async {
  //   var config = await _repository.getAPIKey();
  //
  //   final response = await http.post(
  //     Uri.parse("https://api.openai.com/v1/completions"),
  //     headers: {'Content-Type': 'application/json; charset=utf-8', 'Accept': 'application/json; charset=utf-8', 'Authorization': 'Bearer ${config.apiKey}'},
  //     body: jsonEncode(
  //       {
  //         "model": "gpt-3.5-turbo-instruct",
  //         "prompt": question,
  //         "max_tokens": 250,
  //         "temperature": 0,
  //         "top_p": 1,
  //       },
  //     ),
  //   );
  //
  //   final bytes = response.bodyBytes;
  //   final body = String.fromCharCodes(bytes);
  //
  //   print("response body: $body");
  //
  //   if (response.statusCode != 200) {
  //     return ChatEvent.empty();
  //   }
  //
  //   return ChatEvent.fromJson(body);
  // }

  @override
  Future<ChatEvent> askQuestion(String question) async {
    final request = ChatCompleteText(
      model: GptTurboChatModel(),
      messages: [
        Messages(
          role: Role.user,
          content: question,
        ),
      ],
    );

    final chat = await openAI;

    try {
      final response = await chat!.onChatCompletion(request: request);

      final choice = response!.choices.firstOrNull;

      if (choice == null) {
        return ChatEvent.empty();
      }

      return ChatEvent(message: choice.message?.content ?? "Ops... vamos tentar de novo?");
    } on OpenAIServerError catch (err) {
      log('catch error -> ${err.toString()}');

      return ChatEvent(
        message: "Estou enfrentando problemas no meu servidor. Podemos tentar mais tarde?",
      );
    } on Exception catch (err) {
      log('catch error -> ${err.toString()}');

      return ChatEvent.empty();
    }
  }

  Future<OpenAI?> get openAI async {
    final key = await _repository.getAPIKey();

    if (_openAI == null || _lastUsedKey != key.apiKey) {
      _openAI = OpenAI.instance.build(
        token: key.apiKey,
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 10)),
        enableLog: true,
      );

      _lastUsedKey = key.apiKey;
    }

    return _openAI;
  }
}
