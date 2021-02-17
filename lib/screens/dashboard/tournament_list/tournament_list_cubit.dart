// States

import 'dart:developer';

import 'package:bluestacks_assignment/db/db.dart';
import 'package:bluestacks_assignment/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum TournamentListState { Empty, Loading, Loaded, Error, Ended }

// Cubit

class TournamentListCubit extends Cubit<TournamentListState> {
  List<Tournament> tList = new List();
  String cursor;
  Box tournamentBox;

  TournamentListCubit() : super(TournamentListState.Empty) {
    fetchTList();
    tournamentBox = sl.get<TournamentRepoService>().getTournamentBox();
  }

  fetchTList() async {
    emit(TournamentListState.Loading);
    String _cursor;
    try {
      _cursor = await sl.get<TournamentRepoService>().getTournamentData(cursor);
      tList.addAll(tournamentBox.values);
    } catch (e) {
      log("ERROR IN FETCHING TOURNAMENTS");
      if (cursor == null) {
        emit(TournamentListState.Error);
      }
    }
    cursor = _cursor;
    if (tList.length == 0) {
      emit(TournamentListState.Empty);
    } else {
      if (_cursor == null) {
        emit(TournamentListState.Ended);
      } else {
        emit(TournamentListState.Loaded);
      }
    }
  }

  refreshList() {
    cursor = null;
    fetchTList();
  }

}
