import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/model/note_model.dart';

class NotesProvider extends ChangeNotifier{

final String tableTodo = 'todo';
final String columnId = 'id';
final String columnTitle = 'title';
final String columnDesc = 'description';
final String columnDone = 'done';

 Database? db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableTodo ( 
  $columnId integer primary key autoincrement, 
  $columnTitle text not null,
  $columnDone integer not null)
''');
    });
  }

  Future<NoteModel> insert(NoteModel todo) async {
    todo.id = await db!.insert(tableTodo, todo.toMap());
    return todo;
  }

  Future<NoteModel> getTodo(int id) async {
    List<Map> maps = await db!.query(tableTodo,
        columns: [columnId, columnDone, columnTitle],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return NoteModel.fromMap(maps.first);
    }
    return NoteModel.fromMap(maps.first);
  }

  // Future<int> delete(int id) async {
  //   return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
  // }

  // Future<int> update(Todo todo) async {
  //   return await db.update(tableTodo, todo.toMap(),
  //       where: '$columnId = ?', whereArgs: [todo.id]);
  // }

  Future close() async => db!.close();
}