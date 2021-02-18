import 'dart:developer';

import 'package:bluestacks_assignment/db/db.dart';
import 'package:bluestacks_assignment/services/services.dart';
import 'package:bluestacks_assignment/utilities/pair.dart';
import 'package:hive/hive.dart';

class TournamentRepoService {

  Box<Tournament> getTournamentBox() => Hive.box(kTournamentBox);

  Future<String> getTournamentData([String cursor]) async {

    Pair<List<Map<String, dynamic>>, String> response =
        await sl.get<NetworkService>().fetchTournamentData(cursor);

    if (response == null) return "ERROR";

    log("TOURNAMENT RESPONSE COUNT --------------->>> ${response.first?.length}");

    Box<Tournament> tournamentBox = getTournamentBox();

    response?.first?.forEach((element) {
      try {
        tournamentBox.add(Tournament.fromMap(element));
      } catch(e) {
        log("ERROR!! LOADING TOURNAMENT IN HIVE - \n TOURNAMENT - ${element.toString()} \n $e");
      }
    });

    log("TOURNAMENT HIVE COUNT --------------->>> ${tournamentBox.values.length}");

    return response?.second;
  }
}
