# adv_flutter_database

Sure! Here's a step-by-step outline to guide you in creating a ToDo app with CRUD operations using the `sqflite` package in Flutter:

### Step 1: Project Setup
1. **Create a new Flutter project**:
   - Open your terminal or command prompt.
   - Run the following command to create a new Flutter project:
     ```bash
     flutter create todo_app
     ```
   - Navigate to the project directory:
     ```bash
     cd todo_app
     ```

2. **Add Dependencies**:
   - Open the `pubspec.yaml` file.
   - Add `sqflite` and `path` packages to your dependencies:
     ```yaml
     dependencies:
       flutter:
         sdk: flutter
       sqflite: ^2.0.0+4
       path: ^1.8.0
     ```
   - Save the file and run:
     ```bash
     flutter pub get
     ```

### Step 2: Setting Up the Database
1. **Create a Database Helper Class**:
   - Create a new file in the `lib` directory, e.g., `database_helper.dart`.
   - This class will handle all database operations (CRUD).

### Step 3: Creating Models
1. **Create a ToDo Model**:
   - Create a new file in the `lib` directory, e.g., `todo_model.dart`.
   - This model will represent the ToDo item.

### Step 4: CRUD Operations
1. **Insert a ToDo Item**:
   - Implement the method to add a new ToDo item to the database.

2. **Retrieve ToDo Items**:
   - Implement the method to fetch all ToDo items from the database.

3. **Update a ToDo Item**:
   - Implement the method to update an existing ToDo item.

4. **Delete a ToDo Item**:
   - Implement the method to delete a ToDo item from the database.

### Step 5: User Interface
1. **Create the UI for the ToDo App**:
   - Design the main screen where the list of ToDo items will be displayed.
   - Implement the UI to add a new ToDo item.
   - Implement the UI to edit and delete a ToDo item.

### Step 6: Connecting UI to Database
1. **Integrate Database Operations with UI**:
   - Fetch the ToDo items from the database and display them in the UI.
   - Add functionality to insert, update, and delete ToDo items through the UI.

### Step 7: Testing
1. **Test the App**:
   - Run your Flutter app on an emulator or a physical device.
   - Ensure that all CRUD operations work as expected.

### Summary of Steps:
1. **Project Setup**:
   - Create Flutter project.
   - Add `sqflite` and `path` dependencies.

2. **Database Setup**:
   - Create a database helper class.

3. **Model Creation**:
   - Create a ToDo model.

4. **Implement CRUD Operations**:
   - Insert, retrieve, update, and delete ToDo items.

5. **UI Development**:
   - Design the main UI.
   - Add, edit, and delete ToDo items.

6. **Integration**:
   - Connect UI with database operations.

7. **Testing**:
   - Test the application for proper functionality.

### Database Helper

Create a `database_helper.dart` file to manage the database operations:

```dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'todo_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE todos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT
      )
      '''
    );
  }

  // Insert a new todo
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('todos', row);
  }

  // Get all todos
  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await database;
    return await db.query('todos');
  }

  // Update a todo
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await database;
    int id = row['id'];
    return await db.update('todos', row, where: 'id = ?', whereArgs: [id]);
  }

  // Delete a todo
  Future<int> delete(int id) async {
    Database db = await database;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }
}
```


### Video [(Source Code)](https://github.com/Aksharpatel06/adv_flutter_database/tree/master/lib)



https://github.com/user-attachments/assets/99987d80-6b1c-4b43-9bf8-48278a3ba7fb

