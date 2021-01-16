import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:r6App/screens/search_screen.dart';
import 'package:r6App/screens/verify_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    //
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    //
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    // TextEditingController _uplayNameController = TextEditingController();

    //
    // String _email, _password;
    final auth = FirebaseAuth.instance;
    //
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40.0),
        height: height,
        width: width,
        decoration: BoxDecoration(),
        child: ListView(
          padding: EdgeInsets.only(top: 80.0),
          children: [
            TextField(
              controller: _emailController,
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 80.0),
            MaterialButton(
              onPressed: () async {
                print("${_emailController.text} ${_passwordController.text}");
                await auth.createUserWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VerifyScreen(),
                  ),
                );
              },
              shape: StadiumBorder(
                side: BorderSide(
                  color: Colors.teal,
                  width: 2.0,
                ),
              ),
              height: 60.0,
              minWidth: double.infinity,
              child: Text(
                'GET STARTED',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            MaterialButton(
              onPressed: () async {
                await auth.signInWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              },
              shape: StadiumBorder(
                side: BorderSide(
                  color: Colors.teal,
                  width: 2.0,
                ),
              ),
              height: 60.0,
              minWidth: double.infinity,
              child: Text(
                'Log in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
