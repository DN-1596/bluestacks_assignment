// States


import 'package:bluestacks_assignment/db/db.dart';
import 'package:bluestacks_assignment/screens/authenticate/authenticate.dart';
import 'package:bluestacks_assignment/screens/dashboard/dashboard.dart';
import 'package:bluestacks_assignment/services/services.dart';
import 'package:bluestacks_assignment/ui_components/ui_components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

abstract class WrapperState {}

// Cubit

class WrapperCubit extends Cubit<WrapperState> {
  User user;
  Box<User> _userBox;

  WrapperCubit() : super(WrapperLoadingPlaceHolder()) {
    initializeApp();
  }

  Future<void> initializeApp() async {
    emit(WrapperLoadingPlaceHolder());
    setUpServices();
    await setUpHive();
    _userBox = sl.get<UserRepoService>().getUserBox();
    checkIfUserExists();
  }

  checkIfUserExists() async {
    if (_userBox.values.isEmpty) {
      emit(AuthenticateBasePage());
    } else {
      getInitialState();
    }
  }

  getInitialState() {
    user = _userBox.getAt(0);
    emit(Dashboard(user));
  }

  bool verifyUserCred(String uid, String pwd) =>
      sl.get<UserRepoService>().verifyUserCred(uid, pwd);

  Future<bool> loginUser(String uid) async {
    emit(WrapperLoadingPlaceHolder(message: "LOADING USER",));
    await sl.get<UserRepoService>().loadUserCred(uid);
    checkIfUserExists();
  }

  Future<void> signOut() async {
    await sl.get<UserRepoService>().signOut();
    checkIfUserExists();
  }


}
