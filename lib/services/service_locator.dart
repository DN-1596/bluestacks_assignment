import 'package:bluestacks_assignment/db/db.dart';
import 'package:bluestacks_assignment/services/services.dart';
import 'package:bluestacks_assignment/utilities/localization/localization.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;

GetIt sl = GetIt.instance;

void setUpServices() {
  sl.registerLazySingleton<UserRepoService>(() => UserRepoService());
  sl.registerLazySingleton<TournamentRepoService>(
      () => TournamentRepoService());
  sl.registerLazySingleton<NetworkService>(
          () => NetworkService());
}

setUpHive() async {
  final appDocDirectory = await path.getApplicationDocumentsDirectory();
  Hive.init(appDocDirectory.path);
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(TournamentAdapter());

  if (!Hive.isBoxOpen(kUserBox))
    await Hive.openBox<User>(kUserBox);

  if (!Hive.isBoxOpen(kTournamentBox))
    await Hive.openBox<Tournament>(kTournamentBox);

  if (!Hive.isBoxOpen(kLanguagePref))
    await Hive.openBox<String>(kLanguagePref);
  
  if (Hive.box<String>(kLanguagePref).isEmpty) {
    await Hive.box<String>(kLanguagePref).add(kEnglish);
  }
  
}
