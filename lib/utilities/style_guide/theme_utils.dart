




import 'package:flutter/material.dart';

ThemeData  baseLightTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    primaryColor: Color(0xff422497),
    accentColor: Color(0xffe37b0b),
    hintColor: Colors.grey,
    backgroundColor: Color(0xfff9f9f9),
    cardColor: Colors.white
  );

}