import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  static Future<void> createTable(sql.Database database) async {
    await database.execute('''
  CREATE TABLE operations(id INTEGER PRIMARYKEY AUTOINCREMENT , symbol TEXT, value TEXT)
''');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('operationsdatabase.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTable(database);
    });
  }

  static Future<int> addOperation(String symbol, String value) async {
    final db = await SqlHelper.db();
    final data = {'symbol': symbol, 'value': value};
    final id = db.insert('operations', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getOperations() async {
    final db = await SqlHelper.db();

    return db.query('operations', orderBy: 'id');
  }
  static Future<void> deleteOperation(id) async {
    final db = await SqlHelper.db();

    db.delete('operations', where: 'id = ?', whereArgs: [id]);
  }
}
