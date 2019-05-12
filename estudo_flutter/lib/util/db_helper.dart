import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static _getDBPath() async {
    return join(await getDatabasesPath(), 'study_database.db');
  }

  static final Future<Database> database = openDatabase(
    _getDBPath(),
    version: 1,
    onCreate: (db, version) async {
      return await db.execute(
        "CREATE TABLE person(id INTEGER PRIMARY KEY, name TEXT, urlImage TEXT)",
      );
    },
  );
}
