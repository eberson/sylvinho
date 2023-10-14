import 'package:flutter/material.dart';
import 'package:sylvinho/src/drivers/ui/page/bottom_access_screen.dart';

class HomePage extends StatefulWidget implements BottomAccessScreen {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  BottomNavigationBarItem navigationBarItem() => const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      );

  @override
  Widget screen() => this;
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Text("Home");
  }
}
