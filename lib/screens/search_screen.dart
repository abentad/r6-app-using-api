import 'dart:math';
import 'package:flutter/material.dart';
import 'package:r6App/components/myCustomMaterialButton.dart';
import 'package:r6App/components/myCustomTextField.dart';
import 'package:r6App/models/images_model.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var _searchController = TextEditingController();

  int randomNumber;
  void getRandomNumber() {
    Random random = new Random();
    randomNumber = random.nextInt(12); // from 0 upto 11 included
  }

  @override
  void initState() {
    super.initState();
    getRandomNumber();
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
              myCustomTextField(_searchController),
              SizedBox(height: 20.0),
              myCustomMaterialButton(context, _searchController),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
