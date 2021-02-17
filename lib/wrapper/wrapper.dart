

import 'package:bluestacks_assignment/wrapper/wrapper_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WrapperCubit(),
      child: WrapperChannel(),
    );
  }
}

class WrapperChannel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WrapperCubit,WrapperState>(
        builder: (context,state) {
          return _switchState(state as Widget);
        });
  }

  Widget _switchState(Widget state) {
    return AnimatedSwitcher(
      child: state,
      duration: Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
          child: child,
        );
      },
    );
  }


}

