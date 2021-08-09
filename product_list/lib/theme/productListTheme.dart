import 'package:flutter/material.dart';
import 'package:product_list/theme/colours.dart';

class ProductListTheme {
  static ThemeData get standardTheme => ProductListTheme()._standardTheme;

  final ThemeData _standardTheme = ThemeData(
    primaryColor: Colours.primary,
    primaryColorDark: Colours.darkblue,
    primaryColorLight: Colours.intermediateblue,
    primaryIconTheme: IconThemeData(
      color: Colours.darkblue,
    ),
    accentColor: Colours.green,
    toggleButtonsTheme: ToggleButtonsThemeData(color: Colours.darkblue),
    appBarTheme: AppBarTheme(
        actionsIconTheme: IconThemeData(color: Colours.white),
        iconTheme: IconThemeData(color: Colours.white),
        textTheme: TextTheme(
            headline6: TextStyle(
          color: Colours.white,
          fontSize: 18.0,
          fontFamily: 'RobotoRegular',
        ))),
    brightness: Brightness.light,
    fontFamily: 'RobotoMedium',
  );
}
