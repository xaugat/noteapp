import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/model/note_model.dart';

class NoteDb{
  NoteDb._();
  static final NoteDb db = NoteDb._();

  static Database? _database;
  Future<Database> get database async =>
      _database ??= await initDB();

  initDB() async {
   
    return await openDatabase(await getDatabasesPath()+ 'Noteapp/Notedb.db', version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Notes ("
          "id INTEGER PRIMARY KEY,"
          "title TEXT,"
          "description TEXT,"
          "reminderdate TEXT as ISO8601,"
          "done bool"
          ")");
    });
  }

newNote(NoteModel newNote) async{
  final db = await database;
  var res = await db.insert("Notes", newNote.toMap());
  
  return res;
}


getNotes(int id)async{
  final db = await database;
  var res = await db.query("Notes", where: "id = ?", whereArgs: [id] );
  return res.isNotEmpty? NoteModel.fromMap(res.first): Null;
}

getALLNotes()async{
  final db = await database;
  var res = await db.query("Notes");
  List<NoteModel> list = res.isNotEmpty ? res.map((c)=> NoteModel.fromMap(c)).toList():[];
  return list;

}
  
}


