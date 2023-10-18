import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sylvinho/src/enterprise/entities/message.dart';

class ConversationViewModel extends ChangeNotifier {

  final List<Message> userMessages = [];
  final List<Message> computerMessages = [];

  late Message currentUserMessage;
  late Message currentComputerMessage;

  final _tts = FlutterTts();

  void init() {
    _tts.setSharedInstance(true);
  }
  
  void ask(String content) {
    currentUserMessage = Message.fromMessage(content);
  }
}