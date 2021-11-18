
import 'dart:convert';

import 'package:flutter/cupertino.dart';



class NoteModel{
 int? id;
 String? title;
 String? description;
 String? reminderdate;
 int? done;

 NoteModel({
   @required this.id,
   @required this.title,
   @required this.description,
   @required this.reminderdate,
   @required this.done

 });


 factory NoteModel.fromMap(Map<String, dynamic>json)=> NoteModel(
   id: json['id'],
   title: json['title'],
   description: json['description'],
   reminderdate: json['reminderdate'],
   done: json['done'],
   
   );
   Map<String, dynamic> toMap()=> {
     "id": id,
     "title": title,
     "description": description,
     "reminderdate": reminderdate,
     "done": done

   };


}

NoteModel notefromjson(String str){
  final jsonData = json.decode(str);
  return NoteModel.fromMap(jsonData);
}

String noteToJson(NoteModel noteModel){
  final dyn = noteModel.toMap();
  return json.encode(dyn);
}