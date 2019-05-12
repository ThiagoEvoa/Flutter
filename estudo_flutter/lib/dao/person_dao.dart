import 'package:estudo_flutter/model/person.dart';
import 'package:estudo_flutter/util/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class PersonDAO {
  Database db;

  PersonDAO() {
    getDatabase();
  }

  getDatabase() async {
    db = await DBHelper.database;
  }

  Future<List<Person>> get() async {
    final List<Map<String, dynamic>> maps = await db.query('person');
    return List.generate(maps.length, (i) {
      return Person.fromJson(maps[i]);
    });
  }

  Future<void> insert(Person person) async {
    await db.insert('person', person.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> update(Person person) async {
    await db.update('person', person.toJson(),
        where: "id = ?", whereArgs: [person.id]);
  }

  Future<void> delete(int id) async {
    await db.delete('person', where: "id = ?", whereArgs: [id]);
  }
}
