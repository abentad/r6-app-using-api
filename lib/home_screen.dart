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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purple.withOpacity(0.5),
                  Colors.black.withOpacity(0.5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage('${plInfo['plProfilePic']}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      '${plInfo['plName']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(),
                      child: SvgPicture.network(
                        plInfo['plRankPic'],
                        height: 400.0,
                        width: 400.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Container(
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
                        column1Name: "Ranked KD",
                        column1Result: "${plInfo['plRankedKd']}",
                      ),
                      SizedBox(height: 10.0),
                      myCustomRow(
                        column1Name: "Ranked Deaths",
                        column1Result: "${plInfo['plRankedDeaths']}",
                      ),
                      SizedBox(height: 10.0),
                      myCustomRow(
                        column1Name: "Ranked Kills",
                        column1Result: "${plInfo['plRankedKills']}",
                      ),
                      SizedBox(height: 10.0),
                      myCustomRow(
                        column1Name: "Ranked Matches",
                        column1Result: "${plInfo['plRankedMatches']}",
                      ),
                      SizedBox(height: 10.0),
                      myCustomRow(
                        column1Name: "Ranked Wins",
                        column1Result: "${plInfo['plRankedWins']}",
                      ),
                      SizedBox(height: 10.0),
                      myCustomRow(
                        column1Name: "Ranked Losses",
                        column1Result: "${plInfo['plRankedLosses']}",
                      ),
                      SizedBox(height: 10.0),
                      myCustomRow(
                        column1Name: "Rank",
                        column1Result: "${plInfo['plRankText']}",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row myCustomRow({
    String column1Name,
    String column1Result,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    column1Name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    column1Result,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
