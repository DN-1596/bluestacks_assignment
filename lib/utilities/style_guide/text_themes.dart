
import 'package:bluestacks_assignment/utilities/style_guide/style_guide_barrel.dart';
import 'package:flutter/material.dart';


extension TextThemes on TextTheme {

  TextStyle getHeaderStyle({Color color,double size}) {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: size != null ?  size : 20,
      color: (color != null) ? color : baseLightTheme().primaryColor,
    );
  }

  TextStyle getSubHeaderStyle({Color color,double size}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: size != null ?  size : 16,
      color: (color != null) ? color : baseLightTheme().primaryColor,
    );
  }

  TextStyle getContentStyle({Color color,double size}) {
    return TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: size != null ?  size : 12,
      color: (color != null) ? color : baseLightTheme().primaryColor,
    );
  }

}
