import 'package:sylvinho/src/enterprise/entities/message.dart';

class UserMessage extends Message {
  UserMessage._({required super.content, required super.moment});

  factory UserMessage.fromContent(String message) {
    return UserMessage._(
      content: message,
      moment: DateTime.now(),
    );
  }
}