

import 'package:notes_sqflite/data/model/note_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase{
  Database? database;

  String tableName = "notes";

  LocalDatabase();

  Future<Database> getDb() async{
    if(database == null){
      database = await createDatabase();
      return database!;
    }
    return database!;
  }

  createDatabase()async{
    print("Database ochish uchun harakat boshlandi");

    String databasesPath = await getDatabasesPath();
    String dbPath = '${databasesPath}notes.db';
    print("Databasening manzili $dbPath");

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    print("Database ochildi");
    print("Database ochiqmi: ${database.isOpen}");

    return database;
  }

  void populateDb(Database database, int version) async{
    await database.execute("CREATE TABLE $tableName ("
        "note TEXT,"
        "date TEXT"
        ")");
  }

  Future addNote(NoteModel note)async{
    Database db = await getDb();
    var id = await db.insert(tableName, note.toJson());
    print("Note $id bilan databasega qo'shildi");
  }

  Future<List> getNotes() async{
    Database db = await getDb();
    var result = await db.query(tableName, columns: ["note", 'date']);
    return result.toList();
  }

  Future updateNotes(NoteModel noteModel, String note) async{
    Database db = await getDb();
    var id = await db.update(tableName, noteModel.toJson(), where: "note = ?", whereArgs: [note]);
    print("UPDATE bo'ldi");
  }

  Future<int> deleteNote(String note) async{
    Database db = await getDb();

    return await db.delete(tableName, where: 'note = ?', whereArgs: [note]);
  }


}