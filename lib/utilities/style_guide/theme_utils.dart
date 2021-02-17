




import 'package:flutter/material.dart';

ThemeData  baseLightTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    primaryColor: Color(0xff5371bf),
    accentColor: Color(0xffe37b0b),
    hintColor: Colors.grey,
    backgroundColor: Colors.grey.shade300,
    cardColor: Colors.white,
    secondaryHeaderColor: Colors.black,
  );

}