import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:league_getx/controllers/app.dart';
import 'package:league_getx/data/models/leagues.dart';
import 'package:league_getx/data/models/seasons.dart';
import 'package:league_getx/ui/screens/stats_page.dart';

class AvaiableSeasonListTile extends StatelessWidget {
   AvaiableSeasonListTile({Key? key, required this.seasons, required this.league}) : super(key: key);

  Season seasons;
  League league;
  final AppController _app = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: titleParam(),
      trailing: trailingParam(),
      onTap: () {
        _app.getStatWidgets(league.id!, seasons.year.toString());
        Get.to(()=> StatsPage());
      },
    );
  }

 Widget titleParam(){
    return Text(seasons.displayName!);
  }
  Widget trailingParam(){
    return Icon(Icons.arrow_forward_ios_outlined,
        color: Colors.black54, size: Get.height * 0.02);
  }
}