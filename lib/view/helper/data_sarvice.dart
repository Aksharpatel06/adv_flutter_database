import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataService {
  Database? database;
  static final DataService dataService = DataService._();

  DataService._();


  // CREATE TABLE
  Future<Database?> createDatabase() async {
    String data = await getDatabasesPath();
    String dbPath = join(data, 'demo.db');

    database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE student (id INTEGER ,title TEXT,subtitle TEXT,isDone INTEGER,priority TEXT,PRIMARY KEY("id" AUTOINCREMENT))');
      },
    );
    return database;
  }

  // INSERT DATA
  Future<void> insertData(
      String? title, String? subtitle, int? isDone, String? priority) async {
    await database!.rawInsert(
        'INSERT INTO student (title , subtitle,isDone,priority) VALUES("$title","$subtitle","$isDone","$priority")');
  }

  // READ DATA
  Future<List<Map<String, Object?>>> addData() async {
    String sql = '''
    SELECT * FROM student
    ''';
    return await database!.rawQuery(sql);
  }

  // DELETE DATA
  Future<void> removeData(int id) async {
    String sql = '''
    DELETE FROM student WHERE id = $id
    ''';
    await database!.rawDelete(sql);
  }

  // UPDATE DATA
  Future<void> updateDB(
      int id, String? title, String? subtitle, String? priority) async {
    String sql = '''
    UPDATE student SET title = "$title" ,subtitle ="$subtitle",priority="$priority"   WHERE id = $id
    ''';
    await database!.rawUpdate(sql);
  }

  // UPDATE DATA
  Future<void> updateDBDone(int id, int isDone) async {
    if (isDone == 0) {
      isDone = 1;
    } else {
      isDone = 0;
    }
    String sql = '''
    UPDATE student SET isDone = $isDone   WHERE id = $id
    ''';
    await database!.rawUpdate(sql);
  }
}
