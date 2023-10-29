import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sylvinho/src/drivers/ui/domain/conversation_view_model.dart';
import 'package:sylvinho/src/drivers/ui/mixin/speak_mixin.dart';
import 'package:sylvinho/src/drivers/ui/widgets/text_chat_history.dart';

typedef EnterTextCallback = void Function(String text);

class TextChatView extends StatefulWidget {
  const TextChatView({super.key});

  @override
  State<TextChatView> createState() => _TextChatViewState();
}

class _TextChatViewState extends State<TextChatView> with Speaker {
  final textController = TextEditingController();

  var text = "";

  Future<void> systemSpeak(String content) async {
    await speaker.speak(content);
  }

  @override
  void initState() {
    super.initState();

    initSpeaker();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final viewModel = Provider.of<ConversationViewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 15),
            child: Row(
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
                    icon: Icon(
                      Icons.send,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: TextChatHistory(),
          ),
        ],
      ),
    );
  }
}
