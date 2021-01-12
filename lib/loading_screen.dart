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
  @override
  void initState() {
    super.initState();
    getInfo();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  void getInfo() async {
    plInfo = await getData(widget.name);
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
