import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/db_services/notedb.dart';
import 'package:todoapp/model/note_model.dart';

class NotesProvider extends ChangeNotifier{


Future insertData(title, desc, date)async{
  
  var rng = Random();
  List<NoteModel> noteModel = [
    NoteModel( title: title, description: desc, done: 0, reminderdate: date),

  ];
  NoteModel rnd = noteModel[rng.nextInt(noteModel.length)];
      await NoteDb.db.newNote(rnd);
      print('data sucessfully inserted');
      
      notifyListeners();

}

}