import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class OperationsDatabase {
  static final OperationsDatabase instance = OperationsDatabase._init();
  static Database? _database;

  OperationsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('operationsdatabase.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE operations(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        symbol TEXT,
        value TEXT
      )
      ''');
  }

  Future<int> add(Operation operation) async {
    final db = await instance.database;
    return await db.insert('operations', operation.toJson());
  }

  Future<int> update(Operation operation) async {
    final db = await instance.database;
    return await db.update('operations', operation.toJson(),
        where: 'id = ?', whereArgs: [operation.id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete('operations', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Operation>> getAllOperations() async {
    final db = await instance.database;
    final result = await db.query('operations');
    return result.map((json) => Operation.fromJson(json)).toList();
  }
}

class Operation {
  final int id;
  final String symbol;
  final String value;

  Operation({required this.id, required this.symbol, required this.value});

  Map<String, dynamic> toJson() => {
        'id': id,
        'symbol': symbol,
        'value': value,
      };

  factory Operation.fromJson(Map<String, dynamic> json) => Operation(
        id: json['id'],
        symbol: json['symbol'],
        value: json['value'],
      );
}
