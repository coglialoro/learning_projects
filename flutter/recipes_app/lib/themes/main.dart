import 'package:flutter/material.dart';

final ThemeData defaultTheme = ThemeData.light().copyWith(
  primaryColor: Colors.orange,
  accentColor: Colors.deepOrange,
  floatingActionButtonTheme: ThemeData.light()
      .floatingActionButtonTheme
      .copyWith(backgroundColor: Colors.orange),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.orangeAccent,
      onPrimary: Colors.white,
    ),
  ),
);
