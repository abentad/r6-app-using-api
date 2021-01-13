import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:r6App/search_screen.dart';
import 'package:r6App/signUp_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.black,
    /* set Status bar color in Android devices. */

    statusBarIconBrightness: Brightness.light,
    /* set Status bar icons color in Android devices.*/

    statusBarBrightness: Brightness.light,
  ) /* set Status bar icon color in iOS. */
      );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'R6App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SearchScreen(),
    );
  }
}
