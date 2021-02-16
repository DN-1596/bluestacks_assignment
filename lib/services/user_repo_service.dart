


import 'package:bluestacks_assignment/db/db.dart';
import 'package:hive/hive.dart';

import 'auth_data.dart';

class UserRepoService {

  Box<User> getUserBox() => Hive.box(kUserBox);

  bool verifyUserCred(String uid,String pwd) {

    if (!creds.containsKey(uid)) {
      return false;
    }

    return creds[uid] == pwd;

  }

}