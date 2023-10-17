import 'package:flutter/material.dart';
import 'package:sylvinho/src/drivers/ui/page/bottom_access_screen.dart';
import 'package:sylvinho/src/drivers/ui/widgets/bot_button.dart';
import 'package:sylvinho/src/drivers/ui/widgets/sylvinho.dart';

class BotPage extends StatelessWidget implements BottomAccessScreen {
  const BotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(
              child: Sylvinho(),
            ),
            BotButton(
              text: "Escreva sua pergunta",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  BottomNavigationBarItem navigationBarItem() => const BottomNavigationBarItem(
        icon: Icon(Icons.smart_toy),
        label: "Sylvinho",
      );

  @override
  Widget screen() => this;
}
