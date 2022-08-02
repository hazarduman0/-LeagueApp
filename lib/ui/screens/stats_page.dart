import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:league_getx/controllers/app.dart';

class StatsPage extends StatelessWidget {
  StatsPage({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: GetBuilder<AppController>(builder: (app) {
        return SingleChildScrollView(
          child: Expanded(
              child: app.isLoading
                  ? SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: const Center(child: CircularProgressIndicator()))
                  : Table(
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
                      children: [
                            buildHeaderRow(leagueTableHeaderString),
                          ] +
                          app.tableRowList,
                    )),
        );
      }),
    );
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
}
