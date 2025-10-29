import 'package:flutter/material.dart';
import 'light_color.dart';

class AppTheme {
  const AppTheme();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    // Material 3: drive UI from colorScheme, not primaryColor.
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: LightColor.primary,       // define in light_color.dart
      onPrimary: Colors.white,
      secondary: LightColor.secondary,   // define in light_color.dart
      onSecondary: Colors.white,
      surface: LightColor.background,
      onSurface: LightColor.black,
      background: LightColor.background,
      onBackground: LightColor.black,
      error: const Color(0xFFB3261E),
      onError: Colors.white,
    ),

    scaffoldBackgroundColor: LightColor.background,

    bottomAppBarTheme: BottomAppBarThemeData(
      color: LightColor.background,
      elevation: 0,
    ),

    cardTheme: CardThemeData(
      color: LightColor.background,
      elevation: 1,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    iconTheme: IconThemeData(color: LightColor.iconColor),
    dividerColor: LightColor.lightGrey,

    textTheme: TextTheme(
      bodyMedium: TextStyle(color: LightColor.black),
      titleMedium: TextStyle(color: LightColor.titleTextColor),
    ),
  );

  static TextStyle titleStyle =
  TextStyle(color: LightColor.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle =
  TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style =
  TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = TextStyle(fontSize: 22);
  static TextStyle h3Style = TextStyle(fontSize: 20);
  static TextStyle h4Style = TextStyle(fontSize: 18);
  static TextStyle h5Style = TextStyle(fontSize: 16);
  static TextStyle h6Style = TextStyle(fontSize: 14);

  static List<BoxShadow> shadow = <BoxShadow>[
    const BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
  ];

  static EdgeInsets padding =
  const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(horizontal: 10);

  static double fullWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double fullHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
