import 'package:hive/hive.dart';

const String kLanguagePref = "languagePreference";
const String kEnglish = "English";
const String kJapanese = "Japanese";

final Map<String, String> en = {
  "PREFERRED_LANGUAGE" : "Preferred Language",
  "SELECT_LANGUAGE" : "Select Language",
  "SIGN_OUT" : "Sign Out",
  "RECOMMENDED_FOR_YOU" : "Recommended for you",
  "ELO_RATING" : "ELO Rating",
  "TOURNAMENTS\nPLAYED": "Tournament\nPlayed",
  "TOURNAMENTS\nWON" : "Tournaments\nWon",
  "WINNING\nPERCENTAGE" : "Winning\nPercentage",
  "ERROR_IN_LOADING_TOURNAMENTS": "Error in loading tournaments",
  "TOURNAMENTS_LIST_EMPTY": "Tournaments list empty",
  "LOADING_TOURNAMENTS": "Loading Tournaments",
  "ENTRY_SHOULD_BE_OF_MIN_3_CHARACTERS_AND_MAX_10" : "Entry should be of min 3 characters and max 10.",
  "INVALID_USERID_OR_PASSWORD" : "Invalid User Id or Password.",
  "USER_ID" : "User Id",
  "PASSWORD": "Password",
  "INITIALIZING_APP" : "Initializing App",
  "LOADING_IN": "Loading In",
  "LOADING_USER": "Loading User"
};


final Map<String, String> jap = new Map();

final Map<String, Map<String, String>> languageMap = {
  kEnglish: en,
  kJapanese: jap
};

extension Localize on String {
  String localized() {
    String _languagePreference = Hive.box<String>(kLanguagePref).getAt(0);

    String result = languageMap[_languagePreference ?? kEnglish][this];

    return result ?? this;

  }
}


/*
import 'package:bluestacks_assignment/utilities/localization/localization.dart';
 */