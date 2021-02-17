import 'package:bluestacks_assignment/wrapper/wrapper_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bluestacks_assignment/utilities/style_guide/style_guide_barrel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProceedButton extends StatelessWidget {
  final ValueNotifier<int> uidStatus;
  final ValueNotifier<int> pwdStatus;
  final ValueNotifier<bool> formStatus;
  final String uid;
  final String pwd;

  ProceedButton(
      {@required this.pwdStatus,
      @required this.uidStatus,
      @required this.uid,
      @required this.pwd,
      @required this.formStatus});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: uidStatus,
        builder: (context, _uidStatus, child) {
          return ValueListenableBuilder<int>(
              valueListenable: pwdStatus,
              builder: (context, _pwdStatus, child) {
                bool isClickable = (_uidStatus + _pwdStatus) == 4;

                double _opacity = isClickable ? 1 : 0.3;

                return IgnorePointer(
                  ignoring: !isClickable,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 55),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .accentColor
                              .withOpacity(_opacity),
                          borderRadius: BorderRadius.circular(16)),
                      child: FlatButton(
                        onPressed: () {
                          print("LOGIN PRESSED");
                          formStatus.value = BlocProvider.of<WrapperCubit>(context).verifyUserCred(uid, pwd);
                          if (formStatus.value) {
                            BlocProvider.of<WrapperCubit>(context).loginUser(uid);
                          }
                        },
                        child: Center(
                          child: Text(
                            "LOGIN",
                            style: Theme.of(context)
                                .textTheme
                                .getSubHeaderStyle(
                                    color: Theme.of(context)
                                        .cardColor
                                        .withOpacity(_opacity),
                                    size: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
