import 'package:flutter/material.dart';
import 'package:lig_aplication/model/leagues.dart';
import 'package:lig_aplication/model/seasons.dart';
import 'package:lig_aplication/view/leagueStats.dart';

class AvailableSeasonListTile extends StatelessWidget {
   AvailableSeasonListTile({Key? key, required this.season, required this.league}) : super(key: key);
  Season season;
  League league;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: _titleText(season.displayName!),
      trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 15.0,),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LeagueStats(league: league, season: season)));
      },
    );
  }
}

Text _titleText(String season){
  return Text(season);
}