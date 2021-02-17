import 'package:bluestacks_assignment/ui_components/background_img.dart';
import 'package:bluestacks_assignment/wrapper/wrapper_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:bluestacks_assignment/utilities/style_guide/style_guide_barrel.dart';

class WrapperLoadingPlaceHolder extends StatelessWidget
    implements WrapperState {
  final String message;

  WrapperLoadingPlaceHolder({this.message});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
        child: Stack(
      children: [
        BackgroundIMG("assets/among-us-wallpaper.jpg"),
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
                    child: SpinKitFoldingCube(
                      color: Colors.white,
                      size: 30,
                      duration: Duration(milliseconds: 1900),
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
                          style: Theme.of(context).textTheme.getSubHeaderStyle(
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
    ));
  }
}
