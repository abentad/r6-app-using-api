import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:r6App/components/myCustomRow.dart';

class HomeScreen extends StatefulWidget {
  final receivedJsonData;
  final String searchedName;
  HomeScreen({this.receivedJsonData, this.searchedName});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

class _HomeScreenState extends State<HomeScreen> {
  List data = [];
  bool isConnected;

  //
  @override
  void initState() {
    super.initState();
    checkConnection();
    print(data);
  }

  Box box;
  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('data');
    return;
  }

  Future addData(data) async {
    await box.clear();
    for (var d in data) {
      box.add(d);
    }
  }

  void checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        setState(() {
          isConnected = true;
        });
      }
    } on SocketException catch (_) {
      print('not connected');
      setState(() {
        isConnected = false;
      });
    }
  }

  Future<bool> getAllData() async {
    await openBox();

    try {
      await addData(widget.receivedJsonData);
      // isConnected = true;
      // print("have internet");
    } catch (SocketException) {
      // print('no internet');
      // isConnected = false;
    }
    //
    var myMap = box.toMap().values.toList();
    if (myMap.isEmpty) {
      data.add("empty");
    } else {
      data = myMap;
      // print(data);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: getAllData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (data.contains("empty")) {
                  return Text(
                    "No data",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  );
                } else {
                  return Container(
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
                                  image: isConnected
                                      ? NetworkImage(
                                          '${data[0]['plProfilePic']}',
                                        )
                                      : AssetImage(
                                          'assets/noSignal.png',
                                        ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              '${data[0]['playerName']}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 20.0),
                            Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(),
                              child: isConnected
                                  ? SvgPicture.network(
                                      data[0]['plRankPic'],
                                      height: 400.0,
                                      width: 400.0,
                                    )
                                  : Text(
                                      "offline",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
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
                        ),
                      ],
                    ),
                  );
                }
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}

//
//
//
//
//
//
//
//

// SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.all(20.0),
//             height: height,
//             width: width,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Colors.purple.withOpacity(0.5),
//                   Colors.black.withOpacity(0.5),
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       height: 60.0,
//                       width: 60.0,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: NetworkImage(
//                               '${widget.receivedJsonData['plInfo']['plProfilePic']}'),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 10.0),
//                     Text(
//                       '${widget.receivedJsonData['plInfo']['plName']}',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 28.0,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                     SizedBox(width: 10.0),
//                     Container(
//                       height: 50.0,
//                       width: 50.0,
//                       decoration: BoxDecoration(),
//                       child: SvgPicture.network(
//                         widget.receivedJsonData['plInfo']['plRankPic'],
//                         height: 400.0,
//                         width: 400.0,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20.0),
//                 Container(
//                   padding: EdgeInsets.all(20.0),
//                   // height: 200.0,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.black54,
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Overview',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       SizedBox(height: 10.0),
//                       myCustomRow(
//                         column1Name: "Ranked KD",
//                         column1Result:
//                             "${widget.receivedJsonData['plInfo']['plRankedKd']}",
//                       ),
//                       SizedBox(height: 10.0),
//                       myCustomRow(
//                         column1Name: "Ranked Deaths",
//                         column1Result:
//                             "${widget.receivedJsonData['plInfo']['plRankedDeaths']}",
//                       ),
//                       SizedBox(height: 10.0),
//                       myCustomRow(
//                         column1Name: "Ranked Kills",
//                         column1Result:
//                             "${widget.receivedJsonData['plInfo']['plRankedKills']}",
//                       ),
//                       SizedBox(height: 10.0),
//                       myCustomRow(
//                         column1Name: "Ranked Matches",
//                         column1Result:
//                             "${widget.receivedJsonData['plInfo']['plRankedMatches']}",
//                       ),
//                       SizedBox(height: 10.0),
//                       myCustomRow(
//                         column1Name: "Ranked Wins",
//                         column1Result:
//                             "${widget.receivedJsonData['plInfo']['plRankedWins']}",
//                       ),
//                       SizedBox(height: 10.0),
//                       myCustomRow(
//                         column1Name: "Ranked Losses",
//                         column1Result:
//                             "${widget.receivedJsonData['plInfo']['plRankedLosses']}",
//                       ),
//                       SizedBox(height: 10.0),
//                       myCustomRow(
//                         column1Name: "Rank",
//                         column1Result:
//                             "${widget.receivedJsonData['plInfo']['plRankText']}",
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
