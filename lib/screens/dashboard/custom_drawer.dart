import 'package:bluestacks_assignment/wrapper/wrapper_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bluestacks_assignment/utilities/style_guide/style_guide_barrel.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        FlatButton(
            onPressed: () {
              BlocProvider.of<WrapperCubit>(context).signOut();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.logout,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                Text(
                  "SIGN_OUT",
                  style: Theme.of(context).textTheme.getSubHeaderStyle(
                      color: Theme.of(context).secondaryHeaderColor),
                )
              ],
            ))
      ],
    );
  }
}
