import 'package:bluestacks_assignment/wrapper/wrapper_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrapperLoadingPlaceHolder extends StatelessWidget implements WrapperState{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: CupertinoActivityIndicator(
            radius: 30,
          ),
        ),
      ),
    );
  }
}
