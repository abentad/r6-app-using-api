import "package:flutter/material.dart";
import 'package:r6App/helpers/networking.dart';
import 'package:r6App/home_screen.dart';

class LoadingScreen extends StatefulWidget {
  final String name;
  LoadingScreen({this.name});
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Map<String, String> plInfo;
  Map<String, String> receivedData;
  @override
  void initState() {
    super.initState();
    print('loading Screen got name ${widget.name}');
    getInfo();
  }

  void getInfo() async {
    receivedData = await getData(widget.name);
    assign();
  }

  void assign() {
    setState(() {
      plInfo = receivedData;
    });
    // print('got data plInfo');
    // print(plInfo);
    if (plInfo != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            plInfo: plInfo,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
