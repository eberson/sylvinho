import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:sylvinho/src/drivers/ui/domain/conversation_view_model.dart';
import 'package:sylvinho/src/drivers/ui/mixin/app_bar_leading_mixin.dart';
import 'package:sylvinho/src/drivers/ui/mixin/drawer_mixin.dart';
import 'package:sylvinho/src/drivers/ui/mixin/speak_mixin.dart';
import 'package:sylvinho/src/drivers/ui/page/bottom_access_screen.dart';
import 'package:sylvinho/src/drivers/ui/page/main_page.dart';
import 'package:sylvinho/src/drivers/ui/widgets/speak_button.dart';
import 'package:sylvinho/src/drivers/ui/widgets/sylvinho.dart';
import 'package:sylvinho/src/drivers/ui/widgets/text_chat.dart';
import 'package:sylvinho/src/enterprise/entities/lecture.dart';

class ChatPage extends StatefulWidget with DrawerMixin, AppBarLeading implements BottomAccessScreen {
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
        child: const TextChatView(),
      );

  @override
  Widget? leading() => Builder(
        builder: (BuildContext context) => IconButton(
            icon: const Icon(Icons.keyboard),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: "Entrar no modo conversação por texto",
          ),
      );
}

typedef TTSCallback = EnterTextCallback Function(FlutterTts tts);

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin, Speaker {
  late final AnimationController _controller;

  late bool _speaking;
  
  var _allowInteraction = false;
  var _text = "";

  void onTextToSpeechCompletion() => setState(() {
    final viewModel = Provider.of<ConversationViewModel>(context, listen: false);

    if (viewModel.shouldDoLecture) {
      viewModel.doneLecture();
    }

    _speaking = false;

    _controller.stop();
    _controller.reset();

    setState(() {
      _allowInteraction = true;
    });
  });

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
      _allowInteraction = false;
    });

    _controller.forward();
    await speaker.speak(content);
  }

  void doLectureOrWaitInteraction() {
    final viewModel = Provider.of<ConversationViewModel>(context, listen: false);

    if (viewModel.shouldDoLecture) {
      systemSpeak(lecture);
    } else {
      setState(() {
        _allowInteraction = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    initAnimationController();
    withCompletionHandler(onTextToSpeechCompletion).initSpeaker();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ConversationViewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: Sylvinho(
                controller: _controller,
                onAnimationLoaded: () {
                  if (!_allowInteraction) {
                    WidgetsBinding.instance.addPostFrameCallback((_) => doLectureOrWaitInteraction());
                  }
                },
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
                      _text = result.recognizedWords;
                    }),
                    onFinishTalking: () => viewModel.talk(_text).then((value) => systemSpeak(value)),
                    allowInteraction: _allowInteraction,
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
