import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  final Map<String, String> plInfo;
  HomeScreen({this.plInfo});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, String> plInfo;
  void asignData() {
    setState(() {
      plInfo = widget.plInfo;
    });
  }

  @override
  void initState() {
    super.initState();
    asignData();
    print('inside homescreen');
    print('got data');
    print(plInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Player Name: ${plInfo['plName']}",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text(
                  "Player Ranked KD: ${plInfo['plRankedKd']}",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text(
                  "Player Ranked Deaths: ${plInfo['plRankedDeaths']}",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text(
                  "Player Ranked Kills: ${plInfo['plRankedKills']}",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text(
                  "Player Ranked Matches: ${plInfo['plRankedMatches']}",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text(
                  "Player Ranked Wins: ${plInfo['plRankedWins']}",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text(
                  "Player Ranked Losses: ${plInfo['plRankedLosses']}",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text(
                  "Player Rank Text: ${plInfo['plRankText']}",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                child: SvgPicture.network(
                  plInfo['plRankPic'],
                  height: 400.0,
                  width: 400.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
