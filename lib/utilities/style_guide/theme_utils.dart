




import 'package:flutter/material.dart';

ThemeData  baseLightTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    primaryColor: Color(0xff422497),
    accentColor: Color(0xffe37b0b),
    hintColor: Colors.grey,
    backgroundColor: Colors.grey.shade300,
    cardColor: Colors.white
  );

}