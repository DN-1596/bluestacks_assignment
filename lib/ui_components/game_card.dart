import 'package:animations/animations.dart';
import 'package:bluestacks_assignment/db/db.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {

  final Tournament tournament;

  GameCard(this.tournament);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OpenContainer(
        closedShape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        openShape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        transitionType: ContainerTransitionType.fadeThrough,
        closedColor: Colors.transparent,
        openColor: Colors.transparent,
        transitionDuration: Duration(milliseconds: 500),
        closedElevation: 0.0,
        openElevation: 0.0,
        closedBuilder: (context,action) {
          return AspectRatio(
            aspectRatio: 5 / 2,
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(bottom: 3.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 3.0,

                  ),
                ],),
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
                      child:  LayoutBuilder(
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
                        )),
                  ],
                ),
              ),
            ),
          );
        },
        openBuilder: (context,action) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 3,
                child:  LayoutBuilder(
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
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Center(
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }

}
