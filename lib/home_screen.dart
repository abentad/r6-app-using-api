import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Map<String, String> plInfo;
  HomeScreen({this.plInfo});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, String> plInfo;
  void asignData() {
    plInfo = widget.plInfo;
  }

  @override
  void initState() {
    super.initState();
    asignData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          plInfo['plName'],
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
