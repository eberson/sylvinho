import 'package:flutter/material.dart';
import 'package:sylvinho/src/drivers/ui/page/bottom_access_screen.dart';

class BotPage extends StatelessWidget implements BottomAccessScreen {
  const BotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  BottomNavigationBarItem navigationBarItem() => const BottomNavigationBarItem(
        icon: Icon(Icons.smart_toy),
        label: "Sylvinho",
      );

  @override
  Widget screen() => this;
}
