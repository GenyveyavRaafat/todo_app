import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todoapp/methods/task_model.dart';


class DatabaseConnect{

   Database? _db;

  initDB() async{
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath,'todo.db');
    Database mydb = await openDatabase(path , onCreate: _oncreate);
    return mydb;
  }

  _oncreate(Database db, int version) async{
    await db.execute('''
  CREATE TABLE "todotable"(
    id INTEGER AUTOTINCREMENT NOT NULL PRIMARY KEY, 
    title TEXT NOT NULL,
    Priority TEXT ,
    description TEXT ,
    DateandTime TEXT,
    isDone INTEGER 
  )
''');
  }

  /* insertTask(Task task) async{
    final db =await database;
    await db.insert{
      'todotable',
      Task.toMap(),
      ConflictAlgorithm: ConflictAlgorithm.replace,
    }
  } */
}
