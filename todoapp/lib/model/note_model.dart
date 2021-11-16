
import 'package:flutter/cupertino.dart';

final String noteid = 'id';
final String notetitle = 'title';
final String notedescription = 'description';
final String notestatus = 'done';
final String notedate = 'date';

class NoteModel{
  int? id;
  String? title;
  String? description;
  String? date;
  String? status;

  

    Map<String, Object?> toMap() {
    var map = <String, Object?>{
      notetitle: title,
      notedescription: description,
      notedate: date,
      notestatus: status
    };
    if (id != null) {
      map[noteid] = id;
    }
    return map;
  }

NoteModel();

  NoteModel.fromMap(Map<dynamic, dynamic> map) {
    id = map[noteid];
    title = map[notetitle];
    date = map[notedate];
    status = map[notedate];
  }

}