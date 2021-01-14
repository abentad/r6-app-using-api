import 'package:flutter/material.dart';
import 'package:r6App/helpers/shared_prefs.dart';
import 'package:r6App/screens/loading_screen.dart';

MaterialButton myCustomMaterialButton(
    BuildContext context, TextEditingController controller) {
  return MaterialButton(
    onPressed: () async {
      //for unfocusing the keyboard
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      addStringToSF(controller.text);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoadingScreen(
            name: controller.text,
          ),
        ),
      );
      print("pushed to loading screen name: ${controller.text}");
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
  );
}
