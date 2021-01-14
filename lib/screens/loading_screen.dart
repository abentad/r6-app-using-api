import 'dart:io';

import "package:flutter/material.dart";
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:r6App/helpers/networking.dart';

import 'home_screen.dart';

class LoadingScreen extends StatefulWidget {
  final String name;
  LoadingScreen({this.name});
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Box box;
  var receivedData;
  @override
  void initState() {
    super.initState();
    print('loading Screen got name ${widget.name}');
    getInfo();
  }

  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('data');
    return;
  }

  void getInfo() async {
    try {
      receivedData = await getDataFromInternet(widget.name);
      // final result = await InternetAddress.lookup('google.com');
      if (receivedData.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      var dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
      box = await Hive.openBox('data');
      await openBox();
      var myMap = box.toMap().values.toList();

      print('not connected');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            receivedJsonData: myMap,
            searchedName: widget.name,
          ),
        ),
      );
    }
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
