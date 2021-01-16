import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:r6App/screens/search_screen.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;

  @override
  void initState() {
    super.initState();
    //
    user = auth.currentUser;
    user.sendEmailVerification();
    //a timer that continiously checks whether the user validated their email for 3 seconds
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      checkEmailVerified();
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'An email has been sent to ${user.email} please verify.',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SearchScreen(),
        ),
      );
    }
  }
}
