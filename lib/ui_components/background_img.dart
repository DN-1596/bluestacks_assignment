

import 'package:flutter/material.dart';

class BackgroundIMG extends StatelessWidget {

  final String imagePath;
  final bool darken;

  BackgroundIMG(this.imagePath,{this.darken = true});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
          colors: darken ? [Colors.black, Colors.black45] : [Colors.transparent,Colors.transparent],
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
