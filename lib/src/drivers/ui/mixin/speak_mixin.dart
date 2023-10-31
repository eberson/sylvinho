import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

import 'package:flutter_tts/flutter_tts.dart';

mixin Speaker {
  final _tts = FlutterTts();
  VoidCallback? _onCompletionHandler;

  Speaker withCompletionHandler(VoidCallback onCompletionHandler) {
    _onCompletionHandler = onCompletionHandler;
    return this;
  }

  Future<void> initSpeaker() async {
    if (!kIsWeb) {
      await _tts.setSharedInstance(true);
    }

    await _tts.setSpeechRate(1.0);
    await _tts.setLanguage("pt-BR");
    await _tts.setVolume(1.0);
    await _tts.setPitch(0.8);

    if (_onCompletionHandler != null) {
      _tts.setCompletionHandler(_onCompletionHandler!);
    }
  }

  FlutterTts get speaker => _tts;
}