

import 'package:flutter/material.dart';

class BackgroundIMG extends StatelessWidget {

  final String imagePath;

  BackgroundIMG(this.imagePath);

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
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken)
            ),
          )),
    );
  }
}
