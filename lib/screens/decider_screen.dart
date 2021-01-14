import 'package:flutter/material.dart';
import 'package:r6App/helpers/shared_prefs.dart';
import 'package:r6App/screens/search_screen.dart';
import 'loading_screen.dart';

class DeciderScreen extends StatefulWidget {
  @override
  _DeciderScreenState createState() => _DeciderScreenState();
}

class _DeciderScreenState extends State<DeciderScreen> {
  String decider;
  //
  @override
  void initState() {
    super.initState();
    decide();
  }

  void decide() async {
    decider = await getStringValuesSF();
    setState(() {});
    print(decider);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => decider == "empty"
            ? SearchScreen()
            : LoadingScreen(
                name: decider,
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
