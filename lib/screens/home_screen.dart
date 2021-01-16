import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:r6App/components/overView_container.dart';
import 'package:r6App/components/ranked_container.dart';
import 'package:r6App/screens/search_screen.dart';
import 'package:toast/toast.dart';

class HomeScreen extends StatefulWidget {
  final receivedJsonData;
  final String searchedName;
  HomeScreen({this.receivedJsonData, this.searchedName});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

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

  DateTime current;
  Future<bool> popped() {
    DateTime now = DateTime.now();
    if (current == null || now.difference(current) > Duration(seconds: 2)) {
      current = now;
      Toast.show("Press back again to exit.", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () => popped(),
      child: Scaffold(
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
                      // padding: EdgeInsets.only(left: 20.0, right: 20.0),
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
                      child: ListView(
                        // physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.0),
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
                          overViewContainer(data),
                          SizedBox(height: 20.0),
                          rankedContainer(data),
                          SizedBox(height: 50.0),
                          MaterialButton(
                            onPressed: () async {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchScreen(),
                                ),
                              );
                            },
                            shape: StadiumBorder(
                              side: BorderSide(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            height: 60.0,
                            minWidth: double.infinity,
                            color: Colors.white,
                            child: Text(
                              "Search",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
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
      ),
    );
  }
}
