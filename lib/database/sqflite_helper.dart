import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
    }
    return _db;
  }

  initialDb() async {
    String database = await getDatabasesPath();
    String path = join(database, 'operationsdatabase.db');
    Database db = await openDatabase(path, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute("""
CREATE TABLE operations(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  symbol TEXT,
  value TEXT
)
""");
    print("tabel created !");
  }

  _getData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  _insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  _updatetData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  _deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  getAllOperations() async {
    List<Map> response = await _getData("SELECT * FROM 'operations'");
    return response;
  }

  addOperation(String symbol, String value) async {
    int response = await _insertData(
        "INSERT INTO 'operations' ('symbol', 'value') VALUES ($symbol, $value)");
    return response;
  }

  deleteOperation(int id) async {
    int response =
        await _deleteData("DELETE FROM 'operations' WHERE 'id' = $id");
    return response;
  }

  updateOperation(int id, String symbol, String value) async {
    int response = await _updatetData(
        "UPDATE 'operations' SET 'symbol' = $symbol , 'value' = $value WHERE id = $id ");
    return response;
  }
}
