import 'package:dio/dio.dart';

class SeasonProvider {
  static String getUrl(String leagueId) =>
      'https://api-football-standings.azharimm.site/leagues/$leagueId/seasons';

  static Future<List<dynamic>> getAvailableSeasonList(String leagueId) async {
    List<dynamic> seasonList = [];

    try {
      var response = await Dio().get(getUrl(leagueId));
      if (response.statusCode == 200) {
        if (response.data != null) {
          if (response.data['data'].isNotEmpty) {
            seasonList = response.data['data']['seasons'];
           // print(seasonList);
            //return seasonList;
          }
        }
      }
    } catch (exception) {
      //log(exception.toString());
      return seasonList;
    }
     return seasonList;
    
  }
}
