import 'package:flutter/material.dart';
import 'package:sylvinho/src/drivers/ui/page/bot_page.dart';
import 'package:sylvinho/src/drivers/ui/page/bottom_access_screen.dart';
import 'package:sylvinho/src/drivers/ui/page/config_page.dart';
import 'package:sylvinho/src/drivers/ui/page/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  late int currentScreenIndex;

  final List<BottomAccessScreen> screens = [
    const HomePage(),
    const BotPage(),
    const ConfigPage(),
  ];

  @override
  void initState() {
    super.initState();

    currentScreenIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentScreenIndex].screen(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: currentScreenIndex,
        items: screens.map((e) => e.navigationBarItem()).toList(),
      ),
    );
  }

  void onTabTapped(int index){
    setState(() {
      currentScreenIndex = index;
    });
  }
}
