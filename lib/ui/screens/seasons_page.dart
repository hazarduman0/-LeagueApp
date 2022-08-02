import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:league_getx/controllers/app.dart';
import 'package:league_getx/data/models/leagues.dart';
import 'package:league_getx/ui/widgets/avaiable_seasons_list_tile_widget.dart';
import 'package:league_getx/ui/widgets/current_league_card.dart';

class SeasonsPage extends StatelessWidget {
   SeasonsPage({Key? key, required this.league}) : super(key: key);
  
  League league;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: GetBuilder<AppController>(builder: (app) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.01, vertical: Get.height * 0.01),
          child: Column(
            children: [
              CurrentLeagueCard(currentLeague: app.currentLeague),
              SizedBox(height: Get.height * 0.05),
              Expanded(
                child: app.isLoading ? const Center(child: CircularProgressIndicator()) : ListView.builder(
                  itemCount: app.seasonsList.length,
                  itemBuilder: (context, index) {
                    return AvaiableSeasonListTile(
                        seasons: app.seasonsList[index],
                        league: league
                        );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
