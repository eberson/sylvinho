import 'package:flutter/material.dart';

abstract final class ThemeColors {
  static const Color mainColor = Color.fromRGBO(95, 98, 143, 1.0);
  static MaterialColor mainMaterialColor = MaterialColorGenerator.from(ThemeColors.mainColor);
}

class MaterialColorGenerator {
  static MaterialColor from(Color color) => MaterialColor(color.value, <int, Color>{
    50: color.withOpacity(0.1),
    100: color.withOpacity(0.2),
    200: color.withOpacity(0.3),
    300: color.withOpacity(0.4),
    400: color.withOpacity(0.5),
    500: color.withOpacity(0.6),
    600: color.withOpacity(0.7),
    700: color.withOpacity(0.8),
    800: color.withOpacity(0.9),
    900: color.withOpacity(1.0),
  });
}