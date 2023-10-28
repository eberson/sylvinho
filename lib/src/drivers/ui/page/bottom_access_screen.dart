import 'package:flutter/material.dart';
import 'package:sylvinho/src/drivers/ui/page/drawer_mixin.dart';

abstract class BottomAccessScreen {

  BottomNavigationBarItem navigationBarItem();

  Widget screen();

}