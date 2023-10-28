import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:sylvinho/src/drivers/ui/domain/conversation_view_model.dart';
import 'package:sylvinho/src/drivers/ui/page/bottom_access_screen.dart';
import 'package:sylvinho/src/drivers/ui/page/main_page.dart';
import 'package:sylvinho/src/drivers/ui/widgets/conversation.dart';
import 'package:sylvinho/src/drivers/ui/widgets/speak_button.dart';
import 'package:sylvinho/src/drivers/ui/widgets/sylvinho.dart';

class ChatPage extends StatefulWidget implements BottomAccessScreen {
  const ChatPage({
    super.key,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();

  @override
  BottomNavigationBarItem navigationBarItem() => const BottomNavigationBarItem(
        icon: Icon(Icons.smart_toy),
        label: "Sylvinho",
      );

  @override
  Widget screen() => this;

  @override
  Widget? drawer() => Drawer(
    width: drawerMaxWidth,
    child: const ConversationView(),
  );
}

typedef TTSCallback = EnterTextCallback Function(FlutterTts tts);

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _tts = FlutterTts();

  late final AnimationController _controller;

  late bool _speaking;
  var text = "";

  Future<void> initTextToSpeech() async {
    _speaking = false;

    if (!kIsWeb) {
      await _tts.setSharedInstance(true);
    }

    await _tts.setSpeechRate(1);
    await _tts.setLanguage("pt-BR");
    await _tts.setVolume(1.0);

    _tts.setCompletionHandler(
      () => setState(() {
        _speaking = false;

        _controller.stop();
        _controller.reset();
      }),
    );
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
    final viewModel = Provider.of<ConversationViewModel>(context);

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
            Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SpeakButton(
                    onSpeechResult: (result) => setState(() {
                      text = result.recognizedWords;
                    }),
                    onFinishTalking: () => viewModel.talk(text).then((value) => systemSpeak(value)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
