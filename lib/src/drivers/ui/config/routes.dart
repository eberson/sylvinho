import 'package:flutter/material.dart';
import 'package:sylvinho/src/drivers/ui/page/main_page.dart';

class Routes {
  Routes._();

  static String get initial => "/";

  static Map<String, WidgetBuilder> get routes => {
    "/": (context) => const MainPage(),
  };

}