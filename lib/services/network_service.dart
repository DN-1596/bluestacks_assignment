
import 'dart:convert';
import 'dart:developer';

import 'package:bluestacks_assignment/utilities/api_constants.dart';
import 'package:http/http.dart' as http;


class NetworkService {


  Future<List<Map<String,dynamic>>> fetchUserData() async {
    final response = await http.get(kUserApi);
    List<Map<String,dynamic>> rslt;
    if (response.statusCode == 200) {

      try {
        rslt = List<Map<String,dynamic>>.from(jsonDecode(response.body)) ;
      } catch(e) {
        log("ERROR!! DECODING USER JSON - " + e.toString() );
      }

    }

    return rslt;
  }

}