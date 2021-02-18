import 'package:bluestacks_assignment/screens/dashboard/tournament_list/tlist_loaded.dart';
import 'package:bluestacks_assignment/screens/dashboard/tournament_list/tournament_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bluestacks_assignment/utilities/style_guide/style_guide_barrel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bluestacks_assignment/utilities/localization/localization.dart';


class TournamentListStateUI extends StatelessWidget {
  final int listState;

  TournamentListStateUI(this.listState);

  @override
  Widget build(BuildContext context) {
    if (listState == -2)
      return TournamentListLoading();
    else if (listState == -1)
      return TournamentListEmptyOrError("ERROR_IN_LOADING_TOURNAMENTS".localized());
    else if (listState == 0)
      return TournamentListEmptyOrError("TOURNAMENTS_LIST_EMPTY".localized());
    else if (listState == 1)
      return TListLoaded(
          BlocProvider.of<TournamentListBloc>(context).tList, true);
    else
      return TListLoaded(
          BlocProvider.of<TournamentListBloc>(context).tList, false);
  }
}

class TournamentListLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
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
            )),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "LOADING_TOURNAMENTS".localized(),
                style: Theme.of(context).textTheme.getContentStyle(
                    color: Theme.of(context).secondaryHeaderColor,size: 14),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class TournamentListEmptyOrError extends StatelessWidget {
  final String message;

  TournamentListEmptyOrError(this.message);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            child: Center(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.red, Colors.black]).createShader(bounds);
                },
                child: SvgPicture.asset(
                  "assets/ghost.svg",
                  color: Theme.of(context).hintColor,
                ),
              ),
            )),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message,
                style: Theme.of(context).textTheme.getContentStyle(
                    color: Theme.of(context).secondaryHeaderColor,size: 14),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
