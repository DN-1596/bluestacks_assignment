import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

const String kUserBox = 'user';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  String uid;
  @HiveField(1)
  String name;
  @HiveField(2)
  int eloRating;
  @HiveField(3)
  int tPlayed;
  @HiveField(4)
  int tWon;
  @HiveField(5)
  String gamerAlias;

  User(
      {@required this.uid,
      @required this.name,
      @required this.eloRating,
      @required this.tPlayed,
      @required this.tWon,
      @required this.gamerAlias});

  static User fromMap(Map<String, dynamic> data) {
    return User(
      uid: data["uid"],
      name: data["name"],
      eloRating: data["elo_rating"],
      tPlayed: data["tournaments_played"],
      tWon: data["tournaments_won"],
      gamerAlias: data["gamer_alias"],
    );
  }
}
