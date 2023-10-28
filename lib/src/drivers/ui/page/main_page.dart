import 'package:flutter/material.dart';
import 'package:sylvinho/src/drivers/ui/page/chat_page.dart';
import 'package:sylvinho/src/drivers/ui/page/bottom_access_screen.dart';
import 'package:sylvinho/src/drivers/ui/page/config_page.dart';
import 'package:sylvinho/src/drivers/ui/page/home_page.dart';
import 'package:sylvinho/src/drivers/ui/widgets/conversation.dart';

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
    screens.add(const ConfigPage());

    currentScreenIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    _drawerMaxWidth = MediaQuery
        .of(context)
        .size
        .width / 2;

    return Scaffold(
      appBar: AppBar(
          title: const Text("Sylvinho"),
          leading: Builder(
            builder: (BuildContext context) {
              if (currentScreenIndex == 1) {
                return IconButton(
                  icon: const Icon(Icons.keyboard),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip: "Entrar no modo conversação por texto",
                );
              }

              return const SizedBox();
            },
          ),
      ),
      drawer: screens[currentScreenIndex].drawer(),
      body: screens[currentScreenIndex].screen(),
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
