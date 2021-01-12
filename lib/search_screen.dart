import 'package:flutter/material.dart';
import 'package:r6App/loading_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(),
                    onSubmitted: (value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoadingScreen(
                            name: value,
                          ),
                        ),
                      );
                      print("pushed to loading screen name: $value");
                    },
                  ),
                  // MaterialButton(
                  //   child: Text(
                  //     "Search",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  //   color: Colors.orange,
                  //   onPressed: () {
                  //     // Navigator.push(
                  //     //   context,
                  //     //   MaterialPageRoute(
                  //     //     builder: (context) => LoadingScreen(
                  //     //       name: _searchController.text,
                  //     //     ),
                  //     //   ),
                  //     // );
                  //     // print(
                  //     //     'pushed to loading screen ${_searchController.text}');
                  //   },
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
