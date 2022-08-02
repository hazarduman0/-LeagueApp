import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:league_getx/controllers/app.dart';
import 'package:league_getx/ui/widgets/avaiable_league_list_tile_widget.dart';

class LeaguePage extends StatelessWidget {
  const LeaguePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Leagues Avaiable'), elevation: 0.0,),
      body: GetBuilder<AppController>(
          builder: (app) => app.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: app.avaiableLeuageList.length,
                  itemBuilder: (context, index) {
                    return AvaiableLeagueListTile(
                        league: app.avaiableLeuageList[index]);
                  },
                )),
    );
  }
}
