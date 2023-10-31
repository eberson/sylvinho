import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sylvinho/src/drivers/ui/domain/conversation_view_model.dart';
import 'package:sylvinho/src/drivers/ui/widgets/assistant_message_view.dart';
import 'package:sylvinho/src/drivers/ui/widgets/user_message_view.dart';
import 'package:sylvinho/src/enterprise/entities/assistant_message.dart';
import 'package:sylvinho/src/enterprise/entities/user_message.dart';

class TextChatHistory extends StatelessWidget {
  final ScrollController controller;

  const TextChatHistory({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ConversationViewModel>(context);
    final messages = viewModel.messages;

    return Padding(
      padding: const EdgeInsets.all(6),
      child: ListView.builder(
        controller: controller,
        padding: const EdgeInsets.only(right: 18),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];

          switch (message.runtimeType) {
            case AssistantMessage:
              return AssistantMessageView(message: message);
            case UserMessage:
              return UserMessageView(message: message);
            default:
              return const Text("Not mapped yet");
          }
        },
      ),
    );
  }
}
