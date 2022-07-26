import 'package:flutter/material.dart';
import 'package:lig_aplication/model/leagues.dart';
import 'package:lig_aplication/view/availableSeasons.dart';

class LeagueListTile extends StatelessWidget {
   LeagueListTile({Key? key, required this.imageUrl, required this.leagueName, required this.league}) : super(key: key);

  String? imageUrl;
  String? leagueName;
  League league;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _leagueImageCircleAvatar(imageUrl),
      title: _leagueNameText(leagueName!),
      trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 15.0),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AvailableSeasons(league: league)));
      },

    );
  }
}

CircleAvatar _leagueImageCircleAvatar(String? _imageUrl){
  return CircleAvatar(
    backgroundImage: NetworkImage(_imageUrl!),
  );
}

Text _leagueNameText(String _leagueName) => Text(_leagueName);
  
