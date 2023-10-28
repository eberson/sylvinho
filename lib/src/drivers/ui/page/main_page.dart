import 'package:flutter/material.dart';
import 'package:sylvinho/src/drivers/ui/page/app_bar_actions_mixin.dart';
import 'package:sylvinho/src/drivers/ui/page/app_bar_leading_mixin.dart';
import 'package:sylvinho/src/drivers/ui/page/bottom_access_screen.dart';
import 'package:sylvinho/src/drivers/ui/page/chat_page.dart';
import 'package:sylvinho/src/drivers/ui/page/drawer_mixin.dart';
import 'package:sylvinho/src/drivers/ui/page/home_page.dart';

double _drawerMaxWidth = 10;

double get drawerMaxWidth => _drawerMaxWidth;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int currentScreenIndex;

  final List<BottomAccessScreen> screens = [];

  @override
  void initState() {
    super.initState();

    screens.add(const HomePage());
    screens.add(const ChatPage());

    currentScreenIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    final current = screens[currentScreenIndex];

    _drawerMaxWidth = MediaQuery.of(context).size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sylvinho"),
        leading: current is AppBarLeadingMixin ? (current as AppBarLeadingMixin).leading() : null,
        actions: current is AppBarActionsMixing ? (current as AppBarActionsMixing).actions() : null,
      ),
      drawer: current is DrawerMixin ? (current as DrawerMixin).drawer() : null,
      body: current.screen(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: currentScreenIndex,
        items: screens.map((e) => e.navigationBarItem()).toList(),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentScreenIndex = index;
    });
  }
}
