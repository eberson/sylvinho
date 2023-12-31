import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sylvinho/src/drivers/ui/app.dart';
import 'package:sylvinho/src/drivers/ui/domain/conversation_view_model.dart';
import 'package:sylvinho/src/drivers/ui/mixin/app_bar_actions_mixin.dart';
import 'package:sylvinho/src/drivers/ui/page/bottom_access_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sylvinho/src/drivers/ui/widgets/credit.dart';

class HomePage extends StatefulWidget with AppBarActions implements BottomAccessScreen {
  final MoveToTab moveToTab;

  const HomePage({super.key, required this.moveToTab});

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  BottomNavigationBarItem navigationBarItem() => const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      );

  @override
  Widget screen() => this;

  @override
  List<Widget>? actions() => <Widget>[
        IconButton(
          onPressed: () => navigatorKey.currentState?.pushNamed("/config"),
          icon: const Icon(
            Icons.settings,
          ),
        ),
      ];
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/sylvinho.jpeg',
                  height: 300,
                  fit: kIsWeb ? BoxFit.fitHeight : BoxFit.fitWidth,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final viewModel = Provider.of<ConversationViewModel>(context, listen: false);

                        viewModel.doLecture();
                        widget.moveToTab(1);
                      },
                      child: const Text("Ouvir Explicação"),
                    ),
                    const SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        widget.moveToTab(1);
                      },
                      child: const Text("Iniciar Conversa"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: const Credit(),
        ),
      ],
    );
  }
}
