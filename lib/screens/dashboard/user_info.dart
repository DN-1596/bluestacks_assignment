import 'dart:math';

import 'package:bluestacks_assignment/db/db.dart';
import 'package:bluestacks_assignment/ui_components/ui_components.dart';
import 'package:flutter/material.dart';
import 'package:bluestacks_assignment/utilities/style_guide/style_guide_barrel.dart';

SliverPersistentHeader userInfo(BuildContext context, User user) {
  return SliverPersistentHeader(
    pinned: true,
    delegate: UserInfoDelegate(minHeight: 40.0, maxHeight: 250.0, user: user),
  );
}

class UserInfoDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final User user;

  UserInfoDelegate(
      {@required this.minHeight,
      @required this.maxHeight,
      @required this.user});

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double height = maxHeight - minHeight - shrinkOffset;

    return Container(
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (height > 0) ...[
                _userInfo(context, shrinkOffset, height),
                _stats(context, shrinkOffset, height * (0.4))
              ],
              Container(
                alignment: Alignment.centerLeft,
                height: minHeight,
                child: Text(
                  "RECOMMENDED_FOR_YOU",
                  style: Theme.of(context).textTheme.getSubHeaderStyle(
                      color: Theme.of(context).secondaryHeaderColor),
                ),
              )
            ],
          ),
        ));
  }

  Widget _stats(BuildContext context, double shrinkOffset, double height) {
    double opacity =
        (minHeight - (shrinkOffset < minHeight ? shrinkOffset : minHeight)) /
            minHeight;
    return Container(
      height: height,
      child: (opacity == 0)
          ? null
          : Center(
              child: Opacity(
                  opacity: opacity,
                  child: StatsCard(
                    height: height * (0.9),
                    user: user,
                  )),
            ),
    );
  }

  Widget _userInfo(BuildContext context, double shrinkOffset, double height) {
    double opacity =
        (minHeight - (shrinkOffset < minHeight ? shrinkOffset : minHeight)) /
            minHeight;
    return Container(
      height: height * (0.6),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height * (0.3),
            width: height * (0.3),
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("assets/profilepic.jpg")),
              shape: BoxShape.circle,
            ),
          ),
          if (opacity != 0) ... [
            Opacity(
              opacity: opacity,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.name,
                        style: Theme.of(context).textTheme.getSubHeaderStyle(
                            color: Theme.of(context).secondaryHeaderColor)),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Theme.of(context).primaryColor, width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(user.eloRating.toString(),
                                  style: Theme.of(context).textTheme.getSubHeaderStyle(
                                      color: Theme.of(context).primaryColor)),
                              SizedBox(width: 8.0,),
                              Text("ELO_RATING",
                                  style: Theme.of(context).textTheme.getContentStyle(
                                      color: Theme.of(context).secondaryHeaderColor))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(UserInfoDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight;
  }
}
