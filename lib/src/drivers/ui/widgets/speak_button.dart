import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeakButton extends StatefulWidget {
  final SpeechResultListener onSpeechResult;
  final VoidCallback onFinishTalking;

  const SpeakButton({
    super.key,
    required this.onSpeechResult,
    required this.onFinishTalking,
  });

  @override
  State<SpeakButton> createState() => _SpeakButtonState();
}

const _externalSize = 100.0;
const _externalRadius = 50.0;
const _internalSize = 60.0;
const _internalRadius = 30.0;

class _SpeakButtonState extends State<SpeakButton> {
  final _speechToText = SpeechToText();

  var isListening = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: _externalSize,
      height: _externalSize,
      alignment: Alignment.center,
      child: AvatarGlow(
        endRadius: _externalRadius,
        animate: isListening,
        duration: const Duration(seconds: 2),
        glowColor: Colors.red,
        repeat: true,
        repeatPauseDuration: const Duration(milliseconds: 100),
        showTwoGlows: true,
        child: SizedBox(
          width: _internalSize,
          height: _internalSize,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_internalRadius),
            child: GestureDetector(
              onTapDown: (_) async {
                if (!isListening) {
                  final available = await _speechToText.initialize();

                  if (available) {
                    setState(() {
                      isListening = true;

                      _speechToText.listen(
                        onResult: widget.onSpeechResult,
                        localeId: "pt_BR",
                      );
                    });
                  }
                }
              },
              onTapUp: (_) {
                setState(() {
                  isListening = false;
                });

                widget.onFinishTalking();
                _speechToText.stop();
              },
              child: CircleAvatar(
                radius: _internalRadius,
                backgroundColor: Colors.red,
                child: Icon(
                  isListening ? Icons.mic : Icons.mic_none,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
