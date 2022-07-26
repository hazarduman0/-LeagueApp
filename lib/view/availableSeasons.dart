import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lig_aplication/model/leagues.dart';
import 'package:lig_aplication/model/seasons.dart';
import 'package:lig_aplication/widget/availableSeasonsListTile.dart';
import 'package:lig_aplication/widget/seasonCard.dart';

class AvailableSeasons extends StatefulWidget {
  AvailableSeasons({Key? key, required this.league}) : super(key: key);

  League? league;
  @override
  State<AvailableSeasons> createState() => _AvailableSeasonsState();
}

class _AvailableSeasonsState extends State<AvailableSeasons> {
  late final Dio _dio;
  late String? _leagueId;

  // final _baseUrl = 'https://api-football-standings.azharimm.site/';
  String _baseUrl(String leagueId) =>
      'https://api-football-standings.azharimm.site/leagues/$leagueId/seasons';

  Future<List<Season>> _getAvailableSeasonList() async {
    print('çalıştı');
    var response = await _dio.get(_baseUrl(_leagueId!));
    List<Season> leagueSeasons = [];

    if (response.statusCode == HttpStatus.ok) {
      final responseDatas = response.data;
      final datas = responseDatas['data']['seasons'];

      for (var data in datas) {
        leagueSeasons.add(Season.fromJson(data));
      }
    } else if (response.statusCode == HttpStatus.notFound) {
      print('404');
    }

    return leagueSeasons;
  }

  // Future<List<League>> _getLeagueList() async {
  //   var _response = await _dio.get('${_baseUrl}leagues');
  //   List<League> _listItems = [];

  //   if (_response.statusCode == HttpStatus.ok) {
  //     final _responseDatas = _response.data;
  //     final _datas = _responseDatas['data'];

  //     for (var data in _datas) {
  //       _listItems.add(League.fromJson(data));
  //     }
  //   } else if (_response.statusCode == HttpStatus.notFound) {
  //     print('404');
  //   }

  //   return _listItems;
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dio = Dio();
    _leagueId = widget.league!.id;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: size.height * 0.04),
          _cardBuild(),
          SizedBox(height: size.height * 0.04),
          _futureBuilderBuild()
        ],
      ),
    );
  }

  FutureBuilder<List<Season>> _futureBuilderBuild() {
    return FutureBuilder(
      future: _getAvailableSeasonList(),
      builder: (context, AsyncSnapshot<List<Season>> snapshot) {
        Widget children;
        if (snapshot.hasData) {
          var leagueSeasonsList = snapshot.data!;
          children = Expanded(
            child: ListView.builder(
              itemCount: leagueSeasonsList.length,
              itemBuilder: (context, index) {
                //var seasonString = snapshot.data![index].displayName;
                var season = snapshot.data![index];
                return AvailableSeasonListTile(
                  season: season,
                  league: widget.league!,
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          children = Center(child: Text('${snapshot.error}'));
        } else {
          children = const Center(
            child: CircularProgressIndicator(),
          );
        }
        return children;
      },
    );
  }

  Align _cardBuild() {
    return Align(
      alignment: Alignment.center,
      child: SeasonCard(leagueName: widget.league!.name),
    );
  }
}
