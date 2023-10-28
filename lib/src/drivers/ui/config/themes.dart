import 'package:flutter/material.dart';
import 'package:sylvinho/src/drivers/ui/config/colors.dart';

class Themes {
  Themes._();

  static ThemeData get defaultTheme => ThemeData(
    primarySwatch: ThemeColors.mainMaterialColor,
  );
}