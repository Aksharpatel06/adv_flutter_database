import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataService {
  Database? database;
  static final DataService dataService = DataService._();

  DataService._();

  Future<Database?> createDatabase() async {
    String data = await getDatabasesPath();
    String dbPath = join(data, 'demo.db');

    database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE student (id INTEGER , title TEXT, subtitle TEXT,PRIMARY KEY("id" AUTOINCREMENT))');
      },
    );
    return database;
  }

  Future<void> insertData( String? title, String? subtitle) async {
    await database!.rawInsert(
        'INSERT INTO student (title , subtitle) VALUES("$title","$subtitle")');
  }

  Future<List<Map<String, Object?>>> addData() async {
    String sql = '''
    SELECT * FROM student
    ''';
    return await database!.rawQuery(sql);
  }

  Future<void> removeData(int id) async {
    String sql = '''
    DELETE FROM student WHERE id = $id
    ''';
    await database!.rawDelete(sql);
  }

  Future<void> updateDB(int id, String? title, String? subtitle) async {
    String sql = '''
    UPDATE student SET title = "$title" ,subtitle ="$subtitle"   WHERE id = $id
    ''';
    await database!.rawUpdate(sql);
  }
}
