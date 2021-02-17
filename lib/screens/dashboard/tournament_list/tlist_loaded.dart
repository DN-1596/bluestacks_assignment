import 'package:bluestacks_assignment/db/db.dart';
import 'package:bluestacks_assignment/ui_components/ui_components.dart';
import 'package:flutter/material.dart';
import 'package:bluestacks_assignment/utilities/style_guide/style_guide_barrel.dart';

class TListLoaded extends StatelessWidget {
  final List<Tournament> tlist;
  final bool hasEnded;

  TListLoaded(this.tlist,this.hasEnded);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return (index < tlist.length) ? GameCard(tlist[index]) : null;
        },
      ),
    );
  }
}
