import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SeasonCard extends StatelessWidget {
   SeasonCard({Key? key, required this.leagueName}) : super(key: key);

  String? leagueName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.15,
      width: size.width * 0.9,
      child: Card(
        child: Align(
          alignment: Alignment.center,
          child: Text(leagueName!),
          ),
      ),
    );
  }
}
