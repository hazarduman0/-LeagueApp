import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lig_aplication/model/leagues.dart';
import 'package:lig_aplication/widget/leagueListTile.dart';

class LeaguePage extends StatefulWidget {
  const LeaguePage({Key? key}) : super(key: key);

  @override
  State<LeaguePage> createState() => _LeaguePageState();
}

class _LeaguePageState extends State<LeaguePage> {
  late final Dio _dio;
  final _baseUrl = 'https://api-football-standings.azharimm.site/';

  Future<List<League>> _getLeagueList() async {
    var _response = await _dio.get('${_baseUrl}leagues');
    List<League> _listItems = [];

    if (_response.statusCode == HttpStatus.ok) {
      final _responseDatas = _response.data;
      final _datas = _responseDatas['data'];

      for (var data in _datas) {
        _listItems.add(League.fromJson(data));
      }
    } else if (_response.statusCode == HttpStatus.notFound) {
      print('404');
    }

    return _listItems;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dio = Dio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All League Available'),
      ),
      body: FutureBuilder(
        future: _getLeagueList(),
        builder: (context, AsyncSnapshot<List<League>> snapshot) {
          Widget children;
          if (snapshot.hasData) {
            children = ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var _league = snapshot.data!;
                var _imageUrl = snapshot.data![index].logos!.light;
                var _leagueName = snapshot.data![index].name;
                return LeagueListTile(
                    imageUrl: _imageUrl, leagueName: _leagueName, league: _league[index] ,);
              },
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
      ),
    );
  }
}
