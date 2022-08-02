import 'package:dio/dio.dart';

class LeagueProvider{

  static String url = "https://api-football-standings.azharimm.site/leagues";

  static Future<List<dynamic>> getLeagueList() async{
    List<dynamic> leagueList = <dynamic>[];

    try {
      var response = await Dio().get(url);
      if (response.statusCode == 200) {
        if (response.data != null) {
          if (response.data['data'].isNotEmpty) {
            leagueList = response.data['data'];
          }
        }
      }
    } catch (exception) {
      //log(exception.toString());
      return leagueList;
    }

    return leagueList;
  }
}