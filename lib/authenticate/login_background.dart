

import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
          colors: [Colors.black, Colors.black45],
          begin: Alignment.bottomCenter,
          end: Alignment.center)
          .createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/pubgwallpaper.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken)
            ),
          )),
    );
  }
}
