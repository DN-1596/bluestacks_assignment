import 'package:bluestacks_assignment/db/db.dart';
import 'package:flutter/material.dart';
import 'package:bluestacks_assignment/utilities/style_guide/style_guide_barrel.dart';
import 'package:bluestacks_assignment/utilities/localization/localization.dart';


class StatsCard extends StatelessWidget {
  final height;

  final User user;

  StatsCard({@required this.height, @required this.user});

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double width = height * (5) > maxWidth ? maxWidth : height * 5;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _dataWidget(context,
                data: user.tPlayed?.toString(),
                dataType: "TOURNAMENTS\nPLAYED".localized(),
                start: Color(0xffd18c49),
                end: Color(0xffd3a450)),
            _dataWidget(context,
                data: user.tWon?.toString(),
                dataType: "TOURNAMENTS\nWON".localized(),
                start: Color(0xff553894),
                end: Color(0xff8152a6),
                showBorder: true),
            _dataWidget(context,
                data: ((user.tWon ?? 1)*100 / (user.tPlayed ?? 1))
                        .floor()
                        .toString() +
                    "%",
                dataType: "WINNING\nPERCENTAGE".localized(),
                start: Color(0xffca6357),
                end: Color(0xffdc845c))
          ],
        ),
      ),
    );
  }

  Widget _dataWidget(BuildContext context,
      {String data,
      String dataType,
      Color start,
      Color end,
      bool showBorder = false}) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 3,
      child: Container(
          decoration: BoxDecoration(
              border: showBorder
                  ? Border(
                      left: BorderSide(color: Colors.white, width: 1.2),
                      right: BorderSide(color: Colors.white, width: 1.2))
                  : null,
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [start, end])),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                data ?? "-",
                style: Theme.of(context)
                    .textTheme
                    .getSubHeaderStyle(color: Theme.of(context).cardColor),
                textAlign: TextAlign.center,
              ),
              Text(
                dataType ?? "-",
                style: Theme.of(context).textTheme.getContentStyle(
                    color: Theme.of(context).cardColor, size: 12),
                textAlign: TextAlign.center,
              ),
            ],
          )),
    );
  }
}
