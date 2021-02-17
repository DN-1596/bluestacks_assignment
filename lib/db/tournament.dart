



import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'tournament.g.dart';

const String kTournamentBox = 'tournament';

@HiveType(typeId: 2)
class Tournament extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String gameName;
  @HiveField(2)
  String coverUrl;

  Tournament(
      {@required this.name, @required this.coverUrl, @required this.gameName});

  static Tournament fromMap(Map<String,dynamic> data) {

    return Tournament(
        name: data["name"],
        gameName: data["game_name"],
        coverUrl: data["cover_url"],
    );
  }

}