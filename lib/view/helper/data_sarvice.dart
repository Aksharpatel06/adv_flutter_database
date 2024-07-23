import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataService {
  Database? _database;
  static final DataService dataService = DataService._();
  DataService._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await createDatabase();
    return _database!;
  }

  Future<Database> createDatabase() async {
    String data = await getDatabasesPath();
    String dbPath = join(data, 'demo.db');

    Database database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE student (id INTEGER , name TEXT, age INTEGER, course TEXT,PRIMARY KEY("id" AUTOINCREMENT))');
      },
    );
    return database;
  }

  Future<int> insertData() async {
    final db = await database;
    return await db.rawInsert(
        'INSERT INTO student (name, age, course) VALUES("some name", 1234, "Flutter")');
  }
}
