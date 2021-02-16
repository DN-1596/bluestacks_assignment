




import 'package:flutter/material.dart';

ThemeData  baseLightTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    primaryColor: Color(0xff004caf),
    accentColor: Color(0xffff7d00),
    hintColor: Color(0xffaeaeae),
    backgroundColor: Color(0xfff9f9f9),
    cardColor: Colors.white
  );

}