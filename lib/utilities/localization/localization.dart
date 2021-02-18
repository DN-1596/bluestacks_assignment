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
  "TOURNAMENTS\nPLAYED": "Tournaments\nPlayed",
  "TOURNAMENTS\nWON" : "Tournaments\nWon",
  "WINNING\nPERCENTAGE" : "Winning\nPercentage",
  "ERROR_IN_LOADING_TOURNAMENTS": "Error in loading tournaments",
  "TOURNAMENTS_LIST_EMPTY": "Tournaments list empty",
  "LOADING_TOURNAMENTS": "Loading Tournaments",
  "ENTRY_SHOULD_BE_OF_MIN_3_CHARACTERS_AND_MAX_10" : "Entry should be of min 3 characters and max 10.",
  "INVALID_USERID_OR_PASSWORD" : "Invalid User Id or Password.",
  "USER_ID" : "User Id",
  "PASSWORD": "Password",
  "LOADING_IN": "Loading In",
  "LOADING_USER": "Loading User",
  "LOGIN" : "LOGIN"
};


final Map<String, String> jap = {
  "PREFERRED_LANGUAGE" : "優先言語",
  "SELECT_LANGUAGE" : "言語を選択する",
  "SIGN_OUT" : "ログアウト",
  "RECOMMENDED_FOR_YOU" : "あなたにおすすめ",
  "ELO_RATING" : "ELO 評価",
  "TOURNAMENTS\nPLAYED": "プレーした\nトーナメント",
  "TOURNAMENTS\nWON" : "トーナメント\n優勝",
  "WINNING\nPERCENTAGE" : "勝率\n",
  "ERROR_IN_LOADING_TOURNAMENTS": "トーナメントの読み込み中にエラーが発生しました",
  "TOURNAMENTS_LIST_EMPTY": "トーナメントリストが空です",
  "LOADING_TOURNAMENTS": "トーナメントの読み込み",
  "ENTRY_SHOULD_BE_OF_MIN_3_CHARACTERS_AND_MAX_10" : "エントリは最小3文字、最大10文字である必要があります。",
  "INVALID_USERID_OR_PASSWORD" : "無効なユーザーIDまたはパスワード。",
  "USER_ID" : "ユーザーID",
  "PASSWORD": "パスワード",
  "LOADING_IN": "読み込み中",
  "LOADING_USER": "ユーザーの読み込み",
  "LOGIN" : "ログインする"
};

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