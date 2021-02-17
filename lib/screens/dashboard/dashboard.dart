


import 'package:bluestacks_assignment/wrapper/wrapper_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget implements WrapperState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(child: GestureDetector(
        onTap: () {
          BlocProvider.of<WrapperCubit>(context).signOut();
        },
          child: Text("WELCOME!"))),
    );
  }
}
