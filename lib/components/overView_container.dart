import 'package:flutter/material.dart';

import 'myCustomRow.dart';

Container overViewContainer(List data) {
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
          'Overview',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10.0),
        myCustomRow(
          column1Name: "Total Play time",
          column1Result: "${data[0]['plTotalPlayTime']}",
        ),
        SizedBox(height: 10.0),
        myCustomRow(
          column1Name: "Total Matches",
          column1Result: "${data[0]['plTotalMatchesPlayed']}",
        ),
        SizedBox(height: 10.0),
        myCustomRow(
          column1Name: "Total Wins",
          column1Result: "${data[0]['plTotalWins']}",
        ),
        SizedBox(height: 10.0),
        myCustomRow(
          column1Name: "Total Losses",
          column1Result: "${data[0]['plTotalLosses']}",
        ),
        SizedBox(height: 10.0),
        myCustomRow(
          column1Name: "Total Kills",
          column1Result: "${data[0]['plTotalKills']}",
        ),
        SizedBox(height: 10.0),
        myCustomRow(
          column1Name: "Total Deaths",
          column1Result: "${data[0]['plTotalDeaths']}",
        ),
        SizedBox(height: 10.0),
        myCustomRow(
          column1Name: "Total KD",
          column1Result: "${data[0]['plTotalKD']}",
        ),
      ],
    ),
  );
}
