import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lig_aplication/model/leagues.dart';
import 'package:lig_aplication/model/nStanding.dart';
import 'package:lig_aplication/model/seasons.dart';

class LeagueStats extends StatefulWidget {
  LeagueStats({Key? key, required this.league, required this.season})
      : super(key: key);

  @override
  State<LeagueStats> createState() => _LeagueStatsState();

  Season season;
  League league;
}

class _LeagueStatsState extends State<LeagueStats> {
  late Dio _dio;
  late Season _season;
  late League _league;

  List<String> leagueTableHeaderString = [
    'R',
    'T',
    'G',
    'W',
    'L',
    'D',
    'F',
    'A',
    'Pts'
  ];

  List<Widget>? statRowData;

  // final _baseUrl = 'https://api-football-standings.azharimm.site/leagues/arg.1/standings?season=2022&sort=asc';

  String _baseUrl(String leagueId, int season) =>
      'https://api-football-standings.azharimm.site/leagues/$leagueId/standings?season=${season.toString()}&sort=asc';

  dynamic _dioFunc({required String leagueId, required int season}) async {
    var _response = await _dio.get(_baseUrl(leagueId, season));
    if (_response.statusCode == HttpStatus.ok) {
      return _response.data;
    } else if (_response.statusCode == HttpStatus.notFound) {
      print('404');
    }
  }

  Future<List<Standing>> _getStandings(
      {required String leagueId, required int season}) async {
    final responseDatas = await _dioFunc(leagueId: leagueId, season: season);
    List<Standing> standings = [];

    final datas = responseDatas['data']['standings'];

    for (var data in datas) {
      standings.add(Standing.fromJson(data));
    }

    return standings;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dio = Dio();
    _league = widget.league;
    _season = widget.season;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Expanded(
          child: FutureBuilder(
            future: _getStandings(leagueId: _league.id!, season: _season.year!),
            builder: (context, AsyncSnapshot snapshot) {
              Widget children;
              if (snapshot.hasData) {
                List<Standing> _standingList = snapshot.data;
                // print(_standingList);
                // print(_standingList);
                // List<List<Stat>> _statList = snapshot.data[1];
                // List<Team> _teamList = snapshot.data[0];
                children = Table(
                  border: TableBorder.all(),
                    columnWidths: const {
                      0: FractionColumnWidth(0.1),
                      1: FractionColumnWidth(0.25),
                      2: FractionColumnWidth(0.15),
                      3: FractionColumnWidth(0.05),
                      4: FractionColumnWidth(0.1),
                      5: FractionColumnWidth(0.1),
                      6: FractionColumnWidth(0.1),
                      7: FractionColumnWidth(0.1),
                      8: FractionColumnWidth(0.05),
                    },
                    children: tableChildren(
                        leagueTableHeaderString, _standingList, size));
              } else if (snapshot.hasError) {
                children = Center(child: Text('${snapshot.error}'));
              } else {
                children = const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return children;
            },
          ),
        ),
      ),
    );
  }
}

List<TableRow> tableChildren(
        List<String> cells, List<Standing> standingList, Size size) =>
    [buildHeaderRow(cells)] + tableRowGenerate(standingList, size);

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

tableRowGenerate(List<Standing> standings, Size size) {
  return List.generate(standings.length, (index) {
    var _statList = returnStatInOrder(standings[index].stats!);
    return buildTableRow(_statList, standings[index].team!, size);
  });
}


TableRow buildHeaderRow(List<String> cells) => TableRow(
      children: cells
          .map((cell) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(cell,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 10))),
              ))
          .toList(),
    );

TableRow buildTableRow(List<Stats> stat, Team team, Size size) {
  TextStyle _textStyle = const TextStyle(fontSize: 10);
  String _logoUrl = team.logos!.first.href!;
  return TableRow(children: [
    Center(child: Text(stat[0].displayValue.toString(), style: _textStyle,)),
    Center(
      child: SizedBox(
        width: 120,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             CircleAvatar(
              maxRadius: 5,
              backgroundImage: NetworkImage(_logoUrl),
            ),
            const SizedBox(width: 5),
            Align(
              alignment: Alignment.center,
              child: Text(
              team.shortDisplayName!,
              style: _textStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
                        ),
            )
          ],
        ),
      ),
    ),
    Center(child: Text(stat[1].displayValue.toString(), style: _textStyle,)),
    Center(child: Text(stat[2].displayValue.toString(), style: _textStyle,)),
    Center(child: Text(stat[3].displayValue.toString(), style: _textStyle,)),
    Center(child: Text(stat[4].displayValue.toString(), style: _textStyle,)),
    Center(child: Text(stat[5].displayValue.toString(), style: _textStyle,)),
    Center(child: Text(stat[6].displayValue.toString(), style: _textStyle,)),
    Center(child: Text(stat[7].displayValue.toString(), style: _textStyle.copyWith(fontWeight: FontWeight.bold),)),
  ]);
}
