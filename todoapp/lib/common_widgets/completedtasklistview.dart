import 'package:flutter/material.dart';
import 'package:todoapp/common_widgets/subtitlewidget.dart';
import 'package:todoapp/common_widgets/titlewidgets.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/model/note_model.dart';
import 'package:todoapp/view/notesdetailpage.dart';
class CompletedTaskListView extends StatefulWidget {
  List data;
  // ignore: use_key_in_widget_constructors
  CompletedTaskListView(this.data, { Key? key }) : super(key: key);

  @override
  _CompletedTaskListViewState createState() => _CompletedTaskListViewState();
}

class _CompletedTaskListViewState extends State<CompletedTaskListView> {
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    return 
        Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        color: Colors.white,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: 
                  widget.data == null?
                  Center(child: Text('No todo added.', style: TextStyle(color: Colors.black),),):
                  ListView.builder(
                    
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.data == null? 0: widget.data.length,
                    itemBuilder: (BuildContext context, index){
                      return  InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> NotesDetail(
                          widget.data[index].id.toString(),
                          widget.data[index].title,
                          widget.data[index].description,
                          widget.data[index].reminderdate,
                          widget.data[index].done.toString()

                          
                          )));
                        },
                        child: Container(
                          height: 100,
                          width: 180,
                          child:  Card(
                            
                            color: appcolor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                             
                              
                              title: AppTitle(widget.data[index].title.toString()),
                            // subtitle: Column(
                            //   children: [
                            //     AppSubTitle(widget.data[index].description.toString()),
                            //     const SizedBox(height: 20,),
                             
                                
                                
                            //   ],
                            // ),

                            
                          
                            )
                               
                                // AppSubTitle(data[index].description.toString()),
                                // Text(data[index].done == 0? 'pending': 'done'),
                                // ElevatedButton(onPressed: (){
                                //   notesprovider.deleteNote(data[index].id);
                                //   notesprovider.getDatabase();  
                                // }, child: Text('delete'))
                                
                              
                            
                          ),
                          ),
                        ),
                      );

                    },
                    ),
                ),
    );
      
    
  }
}