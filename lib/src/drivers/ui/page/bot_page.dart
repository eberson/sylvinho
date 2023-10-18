import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:sylvinho/src/drivers/ui/page/bottom_access_screen.dart';
import 'package:sylvinho/src/drivers/ui/widgets/bot_button.dart';
import 'package:sylvinho/src/drivers/ui/widgets/sylvinho.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sylvinho/src/enterprise/entities/lecture.dart';

class BotPage extends StatefulWidget implements BottomAccessScreen {
  const BotPage({super.key});

  @override
  State<BotPage> createState() => _BotPageState();

  @override
  BottomNavigationBarItem navigationBarItem() => const BottomNavigationBarItem(
        icon: Icon(Icons.smart_toy),
        label: "Sylvinho",
      );

  @override
  Widget screen() => this;
}

class _BotPageState extends State<BotPage> with TickerProviderStateMixin {
  final _tts = FlutterTts();

  late final AnimationController _controller;

  late bool _speaking;

  Future<void> initTextToSpeech() async {
    _speaking = false;

    if (!kIsWeb) {
      await _tts.setSharedInstance(true);
    }
    
    await _tts.setSpeechRate(1);

    _tts.setCompletionHandler(
      () => setState(() {
        _speaking = false;
        _controller.reset();
      }),
    );

    setState(() {});
  }

  void initAnimationController() {
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
      }

      if (_speaking) {
        _controller.forward();
      }
    });
  }

  Future<void> systemSpeak(String content) async {
    setState(() {
      _speaking = true;
    });

    _controller.forward();
    await _tts.speak(content);
  }

  @override
  void initState() {
    super.initState();

    initAnimationController();
    initTextToSpeech();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Sylvinho(
                controller: _controller,
              ),
            ),
            BotButton(
              text: "Escreva sua pergunta",
              onPressed: () {
                systemSpeak(lecture);
              },
            ),
          ],
        ),
      ),
    );
  }
}
