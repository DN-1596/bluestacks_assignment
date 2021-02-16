


import 'package:bluestacks_assignment/db/db.dart';
import 'package:hive/hive.dart';

class UserRepoService {

  Box<User> getUserBox() => Hive.box(kUserBox);

}