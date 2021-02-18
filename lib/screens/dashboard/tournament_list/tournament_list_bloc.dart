// States

import 'dart:developer';

import 'package:bluestacks_assignment/db/db.dart';
import 'package:bluestacks_assignment/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

///TournamentListState
/// {
/// Loading = -2,
/// Error = -1,
/// Empty = 0,
/// Ended = 1,
/// Loaded >2}

enum TournamentListEvent { Initiate, Load, Refresh }

// Cubit

class TournamentListBloc
    extends Bloc<TournamentListEvent, int> {
  List<Tournament> tList = new List();
  String cursor;
  int tListLoadedState;

  Box tournamentBox;

  TournamentListBloc() : super(0) {
    tournamentBox = sl.get<TournamentRepoService>().getTournamentBox();
    refreshList();
  }

  @override
  Stream<int> mapEventToState(
      TournamentListEvent event) async* {
    switch (event) {
      case TournamentListEvent.Initiate:
      case TournamentListEvent.Refresh:
        yield* refreshList();
        break;
      case TournamentListEvent.Load:
        yield* fetchTList();
        break;
    }
  }

  Stream<int> fetchTList() async* {
    String _cursor;

      try {
        _cursor =
            await sl.get<TournamentRepoService>().getTournamentData(cursor);
        tList = List<Tournament>.from(tournamentBox.values) ?? <Tournament>[];
      } catch (e) {
        log("ERROR!!  IN FETCHING TOURNAMENTS  - $e");
        _cursor = "ERROR";

      }

      if (_cursor == "ERROR") {
        if (cursor == null) {
          yield -1;
        } else {
          yield 1;
        }
      } else {
        cursor = _cursor;
        if (tList.length == 0) {
          yield 0;
        } else {
          if (_cursor == null) {
            yield 1;
          } else {
            yield tListLoadedState++;
          }
        }
      }


    log("TOURNAMENT LIST COUNT --------------->>> ${tList.length}");
  }

  Stream<int> refreshList() async* {
    yield -2;
    tListLoadedState = 2;
    tList.clear();
    if (tournamentBox.isNotEmpty) {
      tournamentBox.clear();
    }
    cursor = null;
    yield* fetchTList();
  }
}
