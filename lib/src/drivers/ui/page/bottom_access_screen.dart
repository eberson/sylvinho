import 'package:flutter/material.dart';

typedef MoveToTab = void Function(int index);

abstract class BottomAccessScreen {

  BottomNavigationBarItem navigationBarItem();

  Widget screen();
}