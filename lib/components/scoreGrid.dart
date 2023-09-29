import 'package:flutter/material.dart';
import 'package:tictactoe/Constants/colors.dart';

class ScoreGrid extends StatelessWidget {
  const ScoreGrid({
    super.key,
    required this.oScore,
    required this.xScore,
  });

  final int oScore;
  final int xScore;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Player O',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: fontColor),
                ),
                Text(
                  oScore.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: scoreColors),

                ),
              ],
            ),
          ),
          SizedBox(
            width: 130,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Player X',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: fontColor),
                ),
                Text(
                  xScore.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: scoreColors),
                ),
              ],
            ),
          ),
        ],
      )
      ),
    );
  }
}