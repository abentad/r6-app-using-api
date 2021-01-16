import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:r6App/screens/search_screen.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  //gets an instance of auth
  final auth = FirebaseAuth.instance;
  //creates a user variable
  User user;
  //creates a timer variable
  Timer timer;

  @override
  void initState() {
    super.initState();
    //sets the user variable to be the current user trying to sign up
    user = auth.currentUser;
    //sends the current user a verificatoin email
    user.sendEmailVerification();
    //a timer that continiously checks whether the user validated their email for 3 seconds
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      checkEmailVerified();
    });
  }

  @override
  void dispose() {
    super.dispose();
    //cancels the timer when this screen gets disposed
    timer.cancel();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'An email has been sent to ',
            style: TextStyle(
              color: Colors.white,
            ),
            children: [
              TextSpan(
                text: '${user.email}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              TextSpan(
                text: 'Please verify!',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
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
