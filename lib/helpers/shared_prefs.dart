import 'package:shared_preferences/shared_preferences.dart';

getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringValue = prefs.getString('searchTerm') ?? "empty";
  print("from prefs $stringValue");
  return stringValue;
}

addStringToSF(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('searchTerm', value);
}
