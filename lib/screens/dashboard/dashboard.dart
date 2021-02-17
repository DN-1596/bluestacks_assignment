import 'package:bluestacks_assignment/db/db.dart';
import 'package:bluestacks_assignment/screens/dashboard/custom_drawer.dart';
import 'package:bluestacks_assignment/screens/dashboard/tournament_list/tournament_list.dart';
import 'package:bluestacks_assignment/screens/dashboard/tournament_list/tournament_list_bloc.dart';
import 'package:bluestacks_assignment/screens/dashboard/user_info.dart';
import 'package:bluestacks_assignment/wrapper/wrapper_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bluestacks_assignment/utilities/style_guide/style_guide_barrel.dart';

class Dashboard extends StatelessWidget implements WrapperState {
  final User user;

  Dashboard(this.user);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TournamentListBloc>(
      create: (context) => TournamentListBloc(),
      child: DashboardChannel(user),
    );
  }
}

class DashboardChannel extends StatefulWidget {
  final User user;

  DashboardChannel(this.user);

  @override
  _DashboardChannelState createState() => _DashboardChannelState();
}

class _DashboardChannelState extends State<DashboardChannel> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  final ScrollController scrollController = ScrollController();

  TournamentListBloc tBloc;

  bool isLoading = false;

  @override
  void initState() {
    tBloc = BlocProvider.of<TournamentListBloc>(context);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          scrollController.position.extentAfter == 0) {
        _triggerPagination(context);
      }
    });
    tBloc.add(TournamentListEvent.Initiate);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    tBloc = BlocProvider.of<TournamentListBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
        body: BlocListener<TournamentListBloc, int>(
          listener: (context, state) {
            if (state > 0) {
              setState(() {
                isLoading = false;
              });
            }
          },
          child: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: () => _refresh(context),
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!isLoading &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  setState(() {
                    isLoading = true;
                  });
                  _triggerPagination(context);
                }
                return;
              },
              child: CustomScrollView(
                slivers: [userInfo(context, widget.user), TournamentList()],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _refresh(BuildContext context) async =>
      tBloc.add(TournamentListEvent.Refresh);

  _triggerPagination(BuildContext context) =>
      tBloc.add(TournamentListEvent.Load);

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
