import 'dart:developer';

import 'package:bluestacks_assignment/db/db.dart';
import 'package:bluestacks_assignment/services/network_service.dart';
import 'package:bluestacks_assignment/services/services.dart';
import 'package:hive/hive.dart';

import 'auth_data.dart';

class UserRepoService {
  final NetworkService ns = sl.get<NetworkService>();

  Box<User> getUserBox() => Hive.box(kUserBox);

  bool verifyUserCred(String uid, String pwd) {
    if (!creds.containsKey(uid)) {
      return false;
    }

    return creds[uid] == pwd;
  }

  Future<void> loadUserCred(String uid) async {
    List<Map<String, dynamic>> response = await ns.fetchUserData();
    Map<String, dynamic> data =
        response?.firstWhere((element) => element["uid"] == uid);
    return addUserToHive(data);
  }

  Future<void> addUserToHive(Map<String, dynamic> data) async {
    var _userBox = getUserBox();
    try {
      await _userBox.clear();
      User _user = User.fromMap(data);
      await _userBox.add(_user);
    } catch (e) {
      log("ERROR!! ADDING USER TO HIVE - " + e.toString());
    }
  }

  signOut() async => await getUserBox().clear();

}
