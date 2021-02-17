import 'package:bluestacks_assignment/db/db.dart';
import 'package:bluestacks_assignment/screens/dashboard/custom_drawer.dart';
import 'package:bluestacks_assignment/screens/dashboard/user_info.dart';
import 'package:bluestacks_assignment/wrapper/wrapper_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bluestacks_assignment/utilities/style_guide/style_guide_barrel.dart';

class Dashboard extends StatelessWidget implements WrapperState {
  final User user;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();

  Dashboard(this.user);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme
            .of(context)
            .backgroundColor,
        drawer: Drawer(
          child: CustomDrawer(),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: _title(context),
          leading: _leading(context),
        ),
        body: CustomScrollView(
          slivers: [
            userInfo(context, user),
            SliverFixedExtentList(
              itemExtent: 150.0,
              delegate: SliverChildListDelegate(
                [
                  Container(color: Colors.red),
                  Container(color: Colors.purple),
                  Container(color: Colors.green),
                  Container(color: Colors.orange),
                  Container(color: Colors.yellow),                  Container(color: Colors.red),
                  Container(color: Colors.purple),
                  Container(color: Colors.green),
                  Container(color: Colors.orange),
                  Container(color: Colors.yellow),                  Container(color: Colors.red),
                  Container(color: Colors.purple),
                  Container(color: Colors.green),
                  Container(color: Colors.orange),
                  Container(color: Colors.yellow),                  Container(color: Colors.red),
                  Container(color: Colors.purple),
                  Container(color: Colors.green),
                  Container(color: Colors.orange),
                  Container(color: Colors.yellow),                  Container(color: Colors.red),
                  Container(color: Colors.purple),
                  Container(color: Colors.green),
                  Container(color: Colors.orange),
                  Container(color: Colors.yellow),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title(BuildContext context) =>
      Text(user.gamerAlias,
          style: Theme
              .of(context)
              .textTheme
              .getSubHeaderStyle(color: Theme
              .of(context)
              .secondaryHeaderColor));

  Widget _leading(BuildContext context) =>
      FlatButton(
        onPressed: () {
          _scaffoldKey.currentState.openDrawer();
        },
        child: SvgPicture.asset("assets/drawerlogo.svg"),
      );

}
