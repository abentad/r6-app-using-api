import "package:flutter/material.dart";
import 'package:r6App/helpers/networking.dart';

import 'home_screen.dart';

class LoadingScreen extends StatefulWidget {
  final String name;
  LoadingScreen({this.name});
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var receivedData;
  @override
  void initState() {
    super.initState();
    print('loading Screen got name ${widget.name}');
    getInfo();
  }

  void getInfo() async {
    receivedData = await getDataFromInternet(widget.name);
    assign();
  }

  void assign() {
    // print('got data plInfo');
    // print(plInfo);
    if (receivedData != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            receivedJsonData: receivedData,
            searchedName: widget.name,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
