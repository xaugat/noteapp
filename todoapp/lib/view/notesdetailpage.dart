import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';
import 'package:todoapp/common_widgets/normalsubtitle.dart';
import 'package:todoapp/common_widgets/normaltitle.dart';
import 'package:todoapp/common_widgets/subtitlewidget.dart';
import 'package:todoapp/common_widgets/titlewidgets.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/model/note_model.dart';
import 'package:todoapp/view/homepage.dart';
import 'package:todoapp/viewmodel/notesprovider.dart';
class NotesDetail extends StatefulWidget {
  String id;
  String title;
  String description;
  String date;
  String done;
  NotesDetail(this.id,this.title, this.description, this.date, this.done, { Key? key }) : super(key: key);

  @override
  _NotesDetailState createState() => _NotesDetailState(this.id,this.title, this.description, this.date, this.done,);
}

class _NotesDetailState extends State<NotesDetail> {
  String id;
  String title;
  String description;
  String date;
  String done;
  _NotesDetailState(this.id,this.title, this.description, this.date, this.done,);
  @override
  Widget build(BuildContext context) {
     final notesprovider = context.read<NotesProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('Note details'),),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          
          decoration: BoxDecoration(
            color: Colors.teal[600],
            borderRadius: BorderRadius.all(Radius.circular(20))),
          height: MediaQuery.of(context).size.height/2,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children:[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  SizedBox(height: 10,),
                  AppTitle(title),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppSubTitle(description),
                  ),
                  ElevatedButton(
                    
                    onPressed: (){}, child: Text(done == 1?'Completed': 'Pending' ))
                  
                  
            
            
                  
              
              ],),
                ),
             const Positioned(
                bottom: 10,
              left: 300,
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                  child: Icon(Icons.edit, color: Colors.white,),
                  ),
                )),
                Positioned(
                bottom: 10,
                child: AppSubTitle(DateFormat("yyyy-MM-dd h:mma").format(DateTime.parse(date)))
                ),

              ] 
            ),
          ),
        ),
      ),


     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.delete_forever),
       onPressed: (){
            final snackBar = SnackBar(content: Text('Item deleted sucessfully!'));
          notesprovider.deleteNote(int.parse(id)).then((value) => {
          
  ScaffoldMessenger.of(context).showSnackBar(snackBar),
Navigator.pop(context,notesprovider.getDatabase()),


          });

     },
     
     ), 
    );
  }
}