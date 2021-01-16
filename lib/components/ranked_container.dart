import 'package:flutter/material.dart';

import 'myCustomRow.dart';

Container rankedContainer(List data) {
  return Container(
    padding: EdgeInsets.all(20.0),
    // height: 200.0,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.black54,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ranked',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10.0),
        myCustomRow(
          column1Name: "Ranked KD",
          column1Result: "${data[0]['plRankedKd']}",
        ),
        SizedBox(height: 10.0),
        myCustomRow(
          column1Name: "Ranked Deaths",
          column1Result: "${data[0]['plRankedDeaths']}",
        ),
        SizedBox(height: 10.0),
        myCustomRow(
          column1Name: "Ranked Kills",
          column1Result: "${data[0]['plRankedKills']}",
        ),
        SizedBox(height: 10.0),
        myCustomRow(
          column1Name: "Ranked Matches",
          column1Result: "${data[0]['plRankedMatches']}",
        ),
        SizedBox(height: 10.0),
        myCustomRow(
          column1Name: "Ranked Wins",
          column1Result: "${data[0]['plRankedWins']}",
        ),
        SizedBox(height: 10.0),
        myCustomRow(
          column1Name: "Ranked Losses",
          column1Result: "${data[0]['plRankedLosses']}",
        ),
        SizedBox(height: 10.0),
        myCustomRow(
          column1Name: "Rank",
          column1Result: "${data[0]['plRankText']}",
        ),
      ],
    ),
  );
}
