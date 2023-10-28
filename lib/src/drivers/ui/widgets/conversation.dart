import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:sylvinho/src/drivers/ui/domain/conversation_view_model.dart';

typedef EnterTextCallback = void Function(String text);

class ConversationView extends StatefulWidget {
  const ConversationView({super.key});

  @override
  State<ConversationView> createState() => _ConversationViewState();
}

class _ConversationViewState extends State<ConversationView> {
  final textController = TextEditingController();

  final _tts = FlutterTts();

  var text = "";

  Future<void> initTextToSpeech() async {
    if (!kIsWeb) {
      await _tts.setSharedInstance(true);
    }

    await _tts.setSpeechRate(1);
    await _tts.setLanguage("pt-BR");
    await _tts.setVolume(1.0);
  }

  Future<void> systemSpeak(String content) async {
    await _tts.speak(content);
  }

  @override
  void initState() {
    super.initState();

    initTextToSpeech();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ConversationViewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: textController,
                  decoration: const InputDecoration(labelText: "Faça uma pergunta ou escreva algo"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                  onPressed: () async {
                    systemSpeak(await viewModel.talk(textController.text));
                  },
                  icon: const Icon(Icons.send),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
