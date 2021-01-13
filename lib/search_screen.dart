import 'dart:math';

import 'package:flutter/material.dart';
import 'package:r6App/loading_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var _searchController = TextEditingController();
  List<AssetImage> images = [
    AssetImage("assets/bg2.png"),
    AssetImage("assets/bg3.jpg"),
    AssetImage("assets/bg4.jpg"),
    AssetImage("assets/bg5.jpg"),
    AssetImage("assets/bg6.jpg"),
    AssetImage("assets/bg7.jpg"),
    AssetImage("assets/bg8.jpg"),
    AssetImage("assets/bg9.jpg"),
    AssetImage("assets/bg10.jpg"),
    AssetImage("assets/bg11.jpg"),
    AssetImage("assets/bg12.jpg"),
    AssetImage("assets/bg13.jpg"),
    AssetImage("assets/bg14.jpg"),
  ];
  int randomNumber;
  void getNumber() {
    Random random = new Random();
    randomNumber = random.nextInt(12); // from 0 upto 11 included
  }

  @override
  void initState() {
    super.initState();
    getNumber();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: images[randomNumber],
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(10.0),
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.2),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                4,
                8,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextField(
                controller: _searchController,
                cursorColor: Colors.black,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_box),
                  hintText: "Enter name",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 18.0,
                    horizontal: 20.0,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                onSubmitted: (value) {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => LoadingScreen(
                  //       name: value,
                  //     ),
                  //   ),
                  // );
                  // print("pushed to loading screen name: $value");
                },
              ),
              SizedBox(height: 20.0),
              MaterialButton(
                onPressed: () {
                  //for unfocusing the keyboard
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoadingScreen(
                        name: _searchController.text,
                      ),
                    ),
                  );
                  print(
                      "pushed to loading screen name: ${_searchController.text}");
                },
                shape: StadiumBorder(
                  side: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                height: 60.0,
                minWidth: double.infinity,
                color: Colors.white,
                child: Text(
                  "Search",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}

// Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Container(
//               child: Column(
//                 children: [
//                   TextField(
//                     decoration: InputDecoration(),
//                     onSubmitted: (value) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => LoadingScreen(
//                             name: value,
//                           ),
//                         ),
//                       );
//                       print("pushed to loading screen name: $value");
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
