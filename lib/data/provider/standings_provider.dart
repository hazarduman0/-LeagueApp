import 'package:dio/dio.dart';

class StandingsProvider {
  static String getUrl(String year, String leagueId) =>
      'https://api-football-standings.azharimm.site/leagues/$leagueId/standings?season=$year&sort=asc';

  static Future<List<dynamic>> getStandings(
      String leagueId, String year) async {
    List<dynamic> standingsList = [];

    try {
      var response = await Dio().get(getUrl(year, leagueId));
      if (response.statusCode == 200) {
        if (response.data != null) {
          if (response.data['data'].isNotEmpty) {
            standingsList = response.data['data']['standings'];
            // print(seasonList);
            //return seasonList;
          }
        }
      }
    } catch (exception) {
      //log(exception.toString());
      return standingsList;
    }
    return standingsList;
  }
}
