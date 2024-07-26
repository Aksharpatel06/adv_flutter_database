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

  Future<void> insertData() async {
    await database!.rawInsert(
        'INSERT INTO student (title , subtitle) VALUES("some name","Flutter")');
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

  void updateData(int id, String? title, String? subtitle) {
    String sql = '''
    update student SET title = $title ,subtitle =$subtitle   WHERE id = $id
    ''';
  }
}
