import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future openBox(Box box) async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  box = await Hive.openBox('data');
  return;
}
