import 'package:bluestacks_assignment/db/db.dart';
import 'package:bluestacks_assignment/ui_components/ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TListLoaded extends StatelessWidget {
  final List<Tournament> tlist;
  final bool hasEnded;

  TListLoaded(this.tlist,this.hasEnded);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      key: UniqueKey(),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {

          if (index == tlist.length && !hasEnded) {
            return _loader(context);
          }

          return (index < tlist.length) ? GameCard(tlist[index]) : null;
        },
      ),
    );
  }

  Widget _loader(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
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
              size: 25,
            ),
          ),
        ));
  }

}
