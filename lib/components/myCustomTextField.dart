import 'package:flutter/material.dart';

TextField myCustomTextField(TextEditingController controller) {
  return TextField(
    controller: controller,
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
  );
}
