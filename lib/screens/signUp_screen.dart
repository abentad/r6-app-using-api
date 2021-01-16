import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:r6App/screens/search_screen.dart';
import 'package:r6App/screens/verify_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void validateSignUp() async {
    //for unfocusing the keyboard
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    //will check if the current form state is validated
    if (formKey.currentState.validate()) {
      print("validated");
      print(_emailController.text);
      print(_passwordController.text);
      //
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
    } else {
      print('not validated');
    }
  }

  void validateLogIn() async {
    //for unfocusing the keyboard
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    //will check if the current form state is validated
    if (formKey.currentState.validate()) {
      print("validated");
      print(_emailController.text);
      print(_passwordController.text);
      //
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
    } else {
      print('not validated');
    }
  }

  //
  final auth = FirebaseAuth.instance;

  //
  @override
  Widget build(BuildContext context) {
    final devHeight = MediaQuery.of(context).size.height;
    final devWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //devWidth *0.05 = 30.0
            //devHeight *0.05 = 20.0

            padding: EdgeInsets.only(
              left: devWidth * 0.05,
              right: devWidth * 0.05,
              top: devHeight * 0.09,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Hello\nThere',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 60.0,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(
                        text: '.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: devHeight * 0.08),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
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
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Required";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: devHeight * 0.03),
                      TextFormField(
                        controller: _passwordController,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                        obscureText: true,
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
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Required";
                          } else if (value.length < 8) {
                            return "min length must be 8";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: devHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.deepOrange,
                      ),
                    )
                  ],
                ),
                SizedBox(height: devHeight * 0.04),
                MaterialButton(
                  onPressed: validateSignUp,
                  shape: StadiumBorder(),
                  height: 50.0,
                  minWidth: double.infinity,
                  color: Colors.deepOrange,
                  child: Text(
                    "GET STARTED",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: devHeight * 0.04),
                MaterialButton(
                  onPressed: validateLogIn,
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Colors.deepOrange,
                      width: 2.0,
                    ),
                  ),
                  height: 50.0,
                  minWidth: double.infinity,
                  // color: Colors.deepOrange,
                  child: Text(
                    "LOG IN",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: devHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "By signing up you are agreeing to our terms and services.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class SignUpScreen extends StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   @override
//   Widget build(BuildContext context) {
//     //
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     //
//     TextEditingController _emailController = TextEditingController();
//     TextEditingController _passwordController = TextEditingController();
//     // TextEditingController _uplayNameController = TextEditingController();

//     //
//     // String _email, _password;
//     final auth = FirebaseAuth.instance;
//     //
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(40.0),
//         height: height,
//         width: width,
//         decoration: BoxDecoration(),
//         child: ListView(
//           padding: EdgeInsets.only(top: 80.0),
//           children: [
//             TextField(
//               controller: _emailController,
//               obscureText: false,
//               keyboardType: TextInputType.emailAddress,
//               style: TextStyle(
//                 fontSize: 20.0,
//                 color: Colors.white,
//               ),
//               cursorColor: Colors.white,
//               decoration: InputDecoration(
//                 hintText: "Email",
//                 hintStyle: TextStyle(
//                   color: Colors.grey,
//                 ),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.white,
//                   ),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.white,
//                   ),
//                 ),
//                 border: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             TextField(
//               controller: _passwordController,
//               obscureText: true,
//               style: TextStyle(
//                 fontSize: 20.0,
//                 color: Colors.white,
//               ),
//               cursorColor: Colors.white,
//               decoration: InputDecoration(
//                 hintText: "Password",
//                 hintStyle: TextStyle(
//                   color: Colors.grey,
//                 ),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.white,
//                   ),
//                 ),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.white,
//                   ),
//                 ),
//                 border: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 80.0),
//             MaterialButton(
//               onPressed: () async {
//                 print("${_emailController.text} ${_passwordController.text}");
//                 await auth.createUserWithEmailAndPassword(
//                   email: _emailController.text,
//                   password: _passwordController.text,
//                 );
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => VerifyScreen(),
//                   ),
//                 );
//               },
//               shape: StadiumBorder(
//                 side: BorderSide(
//                   color: Colors.teal,
//                   width: 2.0,
//                 ),
//               ),
//               height: 60.0,
//               minWidth: double.infinity,
//               child: Text(
//                 'GET STARTED',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16.0,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             MaterialButton(
//               onPressed: () async {
//                 await auth.signInWithEmailAndPassword(
//                   email: _emailController.text,
//                   password: _passwordController.text,
//                 );
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SearchScreen(),
//                   ),
//                 );
//               },
//               shape: StadiumBorder(
//                 side: BorderSide(
//                   color: Colors.teal,
//                   width: 2.0,
//                 ),
//               ),
//               height: 60.0,
//               minWidth: double.infinity,
//               child: Text(
//                 'Log in',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 16.0,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
