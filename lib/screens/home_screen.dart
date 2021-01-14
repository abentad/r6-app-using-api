import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:r6App/components/myCustomRow.dart';
import 'package:r6App/helpers/converter.dart';
import 'package:r6App/helpers/networking.dart';
import 'package:toast/toast.dart';

class HomeScreen extends StatefulWidget {
  final Map<String, String> plInfo;
  final String searchedName;
  HomeScreen({this.plInfo, this.searchedName});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//Toast.show("Toast plugin app", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

class _HomeScreenState extends State<HomeScreen> {
  List data = [];
  bool isConnected;
  //creates a box for the hive database
  Box box;
  //opens the box called data we created into the directory of the app
  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('data');
    return;
  }

  //takes a jsondecoded response and adds each item in the array into the hive box
  Future addData(data) async {
    //clears old data inside the box before adding new ones
    await box.clear();
    //loops through each data inside array of datas found from api and adds it into the hive box
    for (var d in data) {
      box.add(d);
    }
  }

  Future<void> updateData() async {
    try {
      plInfo = await getData(widget.searchedName);
      await addData(plInfo);
      setState(() {});
      Toast.show("Refreshed", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    } catch (SocketException) {
      //will display a toast at the bottom of the screen indicating there is no internet
      Toast.show("No Internet", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }

  Map<String, String> plInfo;

  void asignData() async {
    setState(() {
      plInfo = widget.plInfo;
    });
    data = convToList(plInfo);
    //opens the box using the function we wrote
    await openBox();
    try {
      await addData(data);
      isConnected = true;
      print("have internet");
    } catch (SocketException) {
      //checks whether there is internet or not using SocketException
      print('no internet');
      isConnected = false;
    }
    //get the data from DB
    //creates a list that holds all values of the hive box after converting it to map and then to list
    var myMap = box.toMap().values.toList();
    //if the list is empty just add empty string to the data variable created at the beginning
    if (myMap.isEmpty) {
      data.add("empty");
    } else {
      //if the list is not empty add all values inside the myMap list to the list data
      data = myMap;
      plInfo = convToMap(data);
    }
  }

  @override
  void initState() {
    super.initState();
    asignData();
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
            child: RefreshIndicator(
              onRefresh: updateData,
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
