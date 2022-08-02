import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentLeagueCard extends StatelessWidget {
   CurrentLeagueCard({Key? key, required this.currentLeague}) : super(key: key);

  String currentLeague;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.05,
      width: Get.width,
      child: Card(
        child: Center(child: Text(currentLeague)),
      ),
    );
  }
}