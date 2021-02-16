import 'package:bluestacks_assignment/style_guide/style_guide_barrel.dart';
import 'package:bluestacks_assignment/ui_components/ui_components.dart';
import 'package:bluestacks_assignment/wrapper/wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flyingwolf',
      theme: baseLightTheme(),
      home: Wrapper(),
    );
  }
}

