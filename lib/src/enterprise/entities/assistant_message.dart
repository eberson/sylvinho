import 'package:sylvinho/src/enterprise/entities/message.dart';

class AssistantMessage extends Message {
  AssistantMessage._({required super.content, required super.moment});

  factory AssistantMessage.fromContent(String message) {
    return AssistantMessage._(
      content: message,
      moment: DateTime.now(),
    );
  }
}