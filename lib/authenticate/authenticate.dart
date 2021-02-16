import 'package:bluestacks_assignment/authenticate/login_background.dart';
import 'package:bluestacks_assignment/authenticate/proceed_button.dart';
import 'package:bluestacks_assignment/wrapper/wrapper_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:bluestacks_assignment/utilities/style_guide/style_guide_barrel.dart';

const Duration kExpand = Duration(milliseconds: 200);

class AuthenticateBasePage extends StatelessWidget implements WrapperState {
  final TextEditingController _uidCtrl = new TextEditingController();
  final TextEditingController _pwdCtrl = new TextEditingController();
  final ValueNotifier<int> _uidStatus = new ValueNotifier(0);
  final ValueNotifier<int> _pwdStatus = new ValueNotifier(0);
  final ValueNotifier<bool> _formStatus = new ValueNotifier(false);
  final String kErrorText = "ENTRY_SHOULD_BE_OF_MIN_3_CHARACTERS_AND_MAX_10";

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
        child: Stack(
          children: [
            LoginBackground(),
            SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: ListView(
                  shrinkWrap: true,
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: SvgPicture.asset("assets/gametvlogo2.svg"),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    _numberField(context),
                    _passwordField(context),
                    SizedBox(
                      height: 50,
                    ),
                    _validateCredentials(),
                    _formStatusWidget(context),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget _formStatusWidget(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _formStatus,
      builder: (context, value, child) {
        return !value ? Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Center(
              child: Text(
                "INVALID_USERNAME_OR_PASSWORD",
                style: Theme
                    .of(context)
                    .textTheme
                    .getContentStyle(color: Theme
                    .of(context)
                    .accentColor, size: 14),
              ),
            ),
          ),
        ) : Container();
      },
    );
  }

  Widget _numberField(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _uidStatus,
      builder: (context, value, child) {
        String _errorText;
        if (value == 1) {
          _errorText = kErrorText;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[600].withOpacity(0.5),
                borderRadius: BorderRadius.circular(16)),
            child: TextField(
              controller: _uidCtrl,
              keyboardType: TextInputType.number,
              style: inputStyle(context),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(
                      Icons.perm_identity,
                      color: Colors.white,
                    ),
                  ),
                  hintText: "USER_ID",
                  hintStyle: hintStyle(context),
                  errorText: _errorText,
                  errorStyle: errorStyle(context),
                  errorMaxLines: 2),
              onChanged: (entry) => _validateEntry(entry, _uidStatus),
            ),
          ),
        );
      },
    );
  }

  Widget _passwordField(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: _pwdStatus,
        builder: (context, value, child) {
          String _errorText;
          if (value == 1) {
            _errorText = kErrorText;
          }
          return Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[600].withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16)),
              child: TextField(
                  obscureText: true,
                  controller: _pwdCtrl,
                  style: inputStyle(context),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16),
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Icon(
                        Icons.security_outlined,
                        color: Colors.white,
                      ),
                    ),
                    hintText: "PASSWORD",
                    hintStyle: hintStyle(context),
                    errorText: _errorText,
                    errorStyle: errorStyle(context),
                    errorMaxLines: 2,
                  ),
                  onChanged: (entry) => _validateEntry(entry, _pwdStatus)),
            ),
          );
        });
  }

  void _validateEntry(String entry, ValueNotifier<int> notifier) {
    if (entry.isEmpty) {
      notifier.value = 0;
      return;
    }

    if (entry.length < 3 || entry.length > 10) {
      notifier.value = 1;
      return;
    }
    notifier.value = 2;
    return;
  }

  Widget _validateCredentials() {
    return ProceedButton(
      pwdStatus: _pwdStatus,
      uidStatus: _uidStatus,
      uid: _uidCtrl.text,
      pwd: _pwdCtrl.text,
      formStatus: _formStatus,
    );
  }

  TextStyle errorStyle(BuildContext context) =>
      Theme
          .of(context)
          .textTheme
          .getSubHeaderStyle(color: Colors.red.shade100, size: 10);

  TextStyle hintStyle(BuildContext context) =>
      Theme
          .of(context)
          .textTheme
          .getContentStyle(color: Theme
          .of(context)
          .hintColor, size: 16);

  TextStyle inputStyle(BuildContext context) =>
      Theme
          .of(context)
          .textTheme
          .getContentStyle(color: Theme
          .of(context)
          .cardColor, size: 16);
}
