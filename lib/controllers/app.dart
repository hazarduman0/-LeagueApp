import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:league_getx/data/models/leagues.dart';
import 'package:league_getx/data/models/seasons.dart';
import 'package:league_getx/data/models/standings.dart';
import 'package:league_getx/data/provider/league_provider.dart';
import 'package:league_getx/data/provider/season_provider.dart';
import 'package:league_getx/data/provider/standings_provider.dart';

class AppController extends GetxController {
  final RxBool _isLoading = false.obs;
  final RxString _currentLeague = ''.obs;
  final RxList<League> _avaiableLeuageList = <League>[].obs;
  final RxList<Season> _seasonsList = <Season>[].obs;
  final RxList<TableRow> _tableRowList = <TableRow>[].obs;

  bool get isLoading => _isLoading.value;
  String get currentLeague => _currentLeague.value;
  List<League> get avaiableLeuageList => _avaiableLeuageList;
  List<Season> get seasonsList => _seasonsList;
  List<TableRow> get tableRowList => _tableRowList;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    populateLeagueList();
  }

  void changeCurrentLeague(String fCurrentLeague) {
    _currentLeague.value = fCurrentLeague;
    update();
  }

  void populateLeagueList() async {
    _isLoading.value = true;
    update();

    var jsonList = await LeagueProvider.getLeagueList();
    var mylist = <League>[];
    for (var i = 0; i < jsonList.length; i++) {
      mylist.add(League.fromJson(jsonList[i]));
    }

    _avaiableLeuageList.assignAll(mylist);
    _isLoading.value = false;
    update();
  }

  void populateSeasonList(String leagueId) async {
    _isLoading.value = true;
    update();

    List<dynamic> jsonList =
        await SeasonProvider.getAvailableSeasonList(leagueId);
    var mylist = <Season>[];
    for (var i = 0; i < jsonList.length; i++) {
      mylist.add(Season.fromJson(jsonList[i]));
    }

    _seasonsList.assignAll(mylist);
    _isLoading.value = false;
    update();
  }

  void getStatWidgets(String leagueId, String year) async {
    _isLoading.value = true;
    update();
    var standingsList = <Standing>[];

    List<dynamic> jsonList =
        await StandingsProvider.getStandings(leagueId, year);

    for (var json in jsonList) {
      standingsList.add(Standing.fromJson(json));
    }

    TextStyle _textStyle = const TextStyle(fontSize: 10);

    _tableRowList.value = List.generate(
        standingsList.length,
        (index) => buildTableRow(
            standingsList[index].stats!,
            standingsList[index].team!.logos!.first.href!,
            standingsList[index].team!.shortDisplayName!,
            _textStyle));
    _isLoading.value = false;
    update();
  }

  List<Stats> returnStatInOrder(List<Stats> stat) {
  List<Stats> _listOfStat = List.generate(stat.length, (index) => Stats());

  for (var data in stat) {
    if (data.name == 'rank') _listOfStat[0] = data;
    if (data.name == 'gamesPlayed') _listOfStat[1] = data;
    if (data.name == 'wins') _listOfStat[2] = data;
    if (data.name == 'losses') _listOfStat[3] = data;
    if (data.name == 'ties') _listOfStat[4] = data;
    if (data.name == 'pointsFor') _listOfStat[5] = data;
    if (data.name == 'pointsAgainst') _listOfStat[6] = data;
    if (data.name == 'points') _listOfStat[7] = data;
  }

  return _listOfStat;
}

  TableRow buildTableRow(List<Stats> statListF, String imageUrlF,
      String leagueShortName, TextStyle textStyleF) {

        List<Stats> _statList = returnStatInOrder(statListF);
    return TableRow(children: [
      Center(
          child: Text(
        _statList[0].displayValue.toString(),
        style: textStyleF,
      )),
      Center(
        child: SizedBox(
          width: 120,
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                maxRadius: 5,
                backgroundImage: NetworkImage(imageUrlF),
              ),
              const SizedBox(width: 5),
              Align(
                alignment: Alignment.center,
                child: Text(
                  leagueShortName,
                  style: textStyleF,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              )
            ],
          ),
        ),
      ),
      Center(
          child: Text(
        _statList[1].displayValue.toString(),
        style: textStyleF,
      )),
      Center(
          child: Text(
        _statList[2].displayValue.toString(),
        style: textStyleF,
      )),
      Center(
          child: Text(
        _statList[3].displayValue.toString(),
        style: textStyleF,
      )),
      Center(
          child: Text(
        _statList[4].displayValue.toString(),
        style: textStyleF,
      )),
      Center(
          child: Text(
        _statList[5].displayValue.toString(),
        style: textStyleF,
      )),
      Center(
          child: Text(
        _statList[6].displayValue.toString(),
        style: textStyleF,
      )),
      Center(
          child: Text(
        _statList[7].displayValue.toString(),
        style: textStyleF.copyWith(fontWeight: FontWeight.bold),
      )),
    ]);
  }
}
