import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:league_getx/controllers/app.dart';
import 'package:league_getx/data/models/leagues.dart';
import 'package:league_getx/ui/screens/seasons_page.dart';

class AvaiableLeagueListTile extends StatelessWidget {
  AvaiableLeagueListTile(
      {Key? key, required this.league})
      : super(key: key);

  League league;
  final AppController _app = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingPram(),
      title: titleParam(),
      trailing: trailingParam(),
      onTap: () {
        _app.changeCurrentLeague(league.name!);
        _app.populateSeasonList(league.id!);
        Get.to(()=>  SeasonsPage(league: league));
      },
    );
  }

  Widget leadingPram() {
    return CircleAvatar(
      backgroundImage: NetworkImage(league.logos!.light!),
      backgroundColor: Colors.transparent,
      maxRadius: Get.height * 0.02, //use getx
    );
  }

  Widget titleParam() {
    return Text(league.name!);
  }

  Widget trailingParam() {
    return Icon(Icons.arrow_forward_ios_outlined,
        color: Colors.black54, size: Get.height * 0.02);
  }
}
