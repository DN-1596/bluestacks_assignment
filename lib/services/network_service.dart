import 'dart:convert';
import 'dart:developer';

import 'package:bluestacks_assignment/utilities/api_constants.dart';
import 'package:bluestacks_assignment/utilities/pair.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  Future<List<Map<String, dynamic>>> fetchUserData() async {
    final response = await http.get(kUserApi);
    List<Map<String, dynamic>> rslt;
    if (response.statusCode == 200) {
      try {
        rslt = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      } catch (e) {
        log("ERROR!! DECODING USER JSON - " + e.toString());
      }
    } else {
      log("ERROR!! IN USER RESPONSE - ${response.statusCode} ");
    }

    return rslt;
  }

  Future<Pair<List<Map<String, dynamic>>, String>> fetchTournamentData(
      [String cursor]) async {

    String _api = kTournamentApi + ((cursor != null) ? "&cursor=$cursor" : "");

    final response = await http.get(_api);
    List<Map<String, dynamic>> _tList;
    String _cursor;
    if (response.statusCode == 200) {
      try {
        Map<String, dynamic> rslt = jsonDecode(response.body);
        _tList = List<Map<String, dynamic>>.from(rslt["data"]["tournaments"]);
        _cursor = rslt["data"]["cursor"];
        return Pair(_tList, _cursor);
      } catch (e) {
        log("ERROR!! DECODING TOURNAMENTS JSON - " + e.toString());
      }
    } else {
      log("ERROR!! IN TOURNAMENT RESPONSE - ${response.statusCode} ");
    }
    return null;
  }
}
