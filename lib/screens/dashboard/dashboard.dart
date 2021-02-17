import 'package:bluestacks_assignment/db/db.dart';
import 'package:bluestacks_assignment/screens/dashboard/custom_drawer.dart';
import 'package:bluestacks_assignment/screens/dashboard/tournament_list/tournament_list.dart';
import 'package:bluestacks_assignment/screens/dashboard/tournament_list/tournament_list_cubit.dart';
import 'package:bluestacks_assignment/screens/dashboard/user_info.dart';
import 'package:bluestacks_assignment/wrapper/wrapper_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bluestacks_assignment/utilities/style_guide/style_guide_barrel.dart';

class Dashboard extends StatefulWidget implements WrapperState {
  final User user;

  Dashboard(this.user);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TournamentListCubit>(
      create: (context) => TournamentListCubit(),
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              backgroundColor: Theme.of(context).backgroundColor,
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
              body: RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: () => _refresh(context),
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [userInfo(context, widget.user), TournamentList()],
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  Future<void> _refresh(BuildContext context) async => BlocProvider.of<TournamentListCubit>(context).refreshList();

  Widget _title(BuildContext context) => Text(widget.user.gamerAlias,
      style: Theme.of(context)
          .textTheme
          .getSubHeaderStyle(color: Theme.of(context).secondaryHeaderColor));

  Widget _leading(BuildContext context) => FlatButton(
        onPressed: () {
          _scaffoldKey.currentState.openDrawer();
        },
        child: SvgPicture.asset("assets/drawerlogo.svg"),
      );
}
