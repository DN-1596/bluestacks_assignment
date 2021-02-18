import 'package:bluestacks_assignment/ui_components/background_img.dart';
import 'package:bluestacks_assignment/wrapper/wrapper_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:bluestacks_assignment/utilities/style_guide/style_guide_barrel.dart';

class WrapperLoadingPlaceHolder extends StatelessWidget
    implements WrapperState {
  final String message;
  final String backgroundImgPath;
  final String backgroundSvgPath;

  WrapperLoadingPlaceHolder({this.message, this.backgroundImgPath,this.backgroundSvgPath});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
        child: Container(
      color: Theme.of(context).backgroundColor,
      child: Stack(
        children: [
          if (backgroundImgPath != null) ...[
            BackgroundIMG(backgroundImgPath),
          ],
          if (backgroundSvgPath != null) ...[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: SizedBox.expand(
                    child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Theme.of(context).accentColor.withOpacity(0.4),
                                Theme.of(context).secondaryHeaderColor
                              ]).createShader(bounds);
                        },
                        child: SvgPicture.asset(backgroundSvgPath)),
                  )
              ),
            )
          ],
          SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Center(
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Theme.of(context).accentColor,
                                Theme.of(context).accentColor.withAlpha(5)
                              ]).createShader(bounds);
                        },
                        child: SpinKitCubeGrid(
                          color: Theme.of(context).hintColor,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  (message != null)
                      ? Container(
                          child: Center(
                              child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 32),
                          child: Text(
                            message,
                            style: Theme.of(context)
                                .textTheme
                                .getSubHeaderStyle(
                                    color: Theme.of(context).cardColor),
                          ),
                        )))
                      : Container(
                          height: 30,
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
