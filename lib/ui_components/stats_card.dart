import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 5 / 1,
        child: Container(
          width: MediaQuery.of(context).size.width,
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
                _dataWidget(start: Color(0xffd18c49), end: Color(0xffd3a450)),
                _dataWidget(
                    start: Color(0xff553894),
                    end: Color(0xff8152a6),
                    showBorder: true),
                _dataWidget(start: Color(0xffca6357), end: Color(0xffdc845c))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dataWidget({Color start, Color end, bool showBorder = false}) {
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
            children: [Text("23"), Text("Sdasdsa")],
          )),
    );
  }
}
