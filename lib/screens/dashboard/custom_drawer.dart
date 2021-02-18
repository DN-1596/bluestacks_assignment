import 'dart:developer';

import 'package:bluestacks_assignment/ui_components/ui_components.dart';
import 'package:bluestacks_assignment/utilities/localization/localization.dart';
import 'package:bluestacks_assignment/wrapper/wrapper_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bluestacks_assignment/utilities/style_guide/style_guide_barrel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _gameTvLogo(context),
          _languagePreference(context),
          Divider(
            height: 1,
            thickness: 1,
            color: Theme.of(context).hintColor,
          ),
          _signOut(context)
        ],
      ),
    );
  }

  Widget _gameTvLogo(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Stack(
            children: [
              BackgroundIMG("assets/gtvbackground.jpg"),
              SizedBox.expand(
                child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Theme.of(context).cardColor.withOpacity(0.4),
                            Theme.of(context).cardColor
                          ]).createShader(bounds);
                    },
                    child: SvgPicture.asset("assets/gametvlogo2.svg")),
              ),
            ],
          )),
    );
  }

  Widget _signOut(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).secondaryHeaderColor, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        child: FlatButton(
            onPressed: () {
              BlocProvider.of<WrapperCubit>(context).signOut();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "SIGN_OUT".localized(),
                    style: Theme.of(context).textTheme.getSubHeaderStyle(
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                ),
                Icon(
                  Icons.logout,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ],
            )),
      ),
    );
  }

  Widget _languagePreference(BuildContext context) {
    return ValueListenableBuilder<Box<String>>(
      valueListenable: Hive.box<String>(kLanguagePref).listenable(),
      builder: (context, value,child) {

        String selectedValue = value.getAt(0);

        log("language changed!!! ---->> $selectedValue");

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "PREFERRED_LANGUAGE".localized(),
                style: Theme.of(context).textTheme.getSubHeaderStyle(
                    color: Theme.of(context).secondaryHeaderColor),
              ),
              DropdownButton<String>(
                value: selectedValue,
                hint: Text(
                  "SELECT_LANGUAGE".localized(),
                  style: Theme.of(context).textTheme.getContentStyle(
                      color: Theme.of(context).secondaryHeaderColor),
                ),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                iconSize: 24,
                elevation: 16,
                style: Theme.of(context).textTheme.getSubHeaderStyle(),
                underline: Container(
                  height: 2,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                onChanged: (String language) {
                  BlocProvider.of<WrapperCubit>(context).changeLanguage(language);
                },
                items: <String>[kEnglish, kJapanese]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      }
    );
  }
}
