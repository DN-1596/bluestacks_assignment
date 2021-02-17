import 'package:animations/animations.dart';
import 'package:bluestacks_assignment/db/db.dart';
import 'package:flutter/material.dart';
import 'package:bluestacks_assignment/utilities/style_guide/style_guide_barrel.dart';

class GameCard extends StatelessWidget {
  final Tournament tournament;

  GameCard(this.tournament);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: OpenContainer(
        closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        openShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        transitionType: ContainerTransitionType.fadeThrough,
        closedColor: Colors.transparent,
        openColor: Colors.transparent,
        transitionDuration: Duration(milliseconds: 500),
        closedElevation: 0.0,
        openElevation: 0.0,
        closedBuilder: (context, action) {
          return AspectRatio(
            aspectRatio: 5 / 2.2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(bottom: 3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: Offset(0.0, 1.0),
                    blurRadius: 3.0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 3,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Image.network(
                            tournament.coverUrl,
                            fit: BoxFit.cover,
                            width: constraints.maxWidth,
                          );
                        },
                      ),
                    ),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 2,
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  flex: 7,
                                  child: _tournamentInfo(context,mainAxisSize: MainAxisSize.max),
                                ),
                                Flexible(
                                  fit: FlexFit.tight,
                                  flex: 3,
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Theme.of(context).hintColor,
                                      size: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          );
        },
        openBuilder: (context, action) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Image.network(
                      tournament.coverUrl,
                      fit: BoxFit.cover,
                      width: constraints.maxWidth,
                    );
                  },
                ),
              ),
              Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: Container(
                    color: Theme.of(context).backgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: ListTile(
                        leading: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).hintColor),
                            child: Icon(
                              Icons.arrow_back,
                              color: Theme.of(context).cardColor,
                            ),
                          ),
                        ),
                        title: _tournamentInfo(context,mainAxisSize: MainAxisSize.min,softWrap: true),
                      ),
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }

  Widget _tournamentInfo(BuildContext context,{MainAxisSize mainAxisSize,bool softWrap = false}) {
    return Column(
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tournament.name.toString(),
          style: Theme.of(context).textTheme.getSubHeaderStyle(
              color: Theme.of(context).secondaryHeaderColor, size: 14),
          softWrap: softWrap,
          overflow: softWrap ? null : TextOverflow.ellipsis,
        ),
        Text(
          tournament.gameName.toString(),
          style: Theme.of(context)
              .textTheme
              .getContentStyle(color: Theme.of(context).primaryColor, size: 12),
          softWrap: softWrap,
          overflow: softWrap ? null : TextOverflow.ellipsis,
        )
      ],
    );
  }
}
