
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/common_widgets/subtitlewidget.dart';
import 'package:todoapp/common_widgets/titlewidgets.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/model/note_model.dart';
import 'package:todoapp/view/notesdetailpage.dart';
import 'package:todoapp/viewmodel/notesprovider.dart';
class TaskListView extends StatefulWidget {
  List data;
  TaskListView(this.data, { Key? key }) : super(key: key);

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
bool tap = false;


  @override
  
  Widget build(BuildContext context) {
 final notesprovider = context.read<NotesProvider>();
    print(widget.data);
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        color: Colors.white,
                  height: 280,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    
                    scrollDirection: Axis.vertical,
                    itemCount: widget.data == null? 0: widget.data.length,
                    itemBuilder: (BuildContext context, index){
                      return  InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> NotesDetail(
                            widget.data[index].id.toString(),
                          widget.data[index].title,
                          widget.data[index].description,
                          widget.data[index].reminderdate,
                          widget.data[index].done.toString(),
                          )));
                        },
                        child: Container(
                          height: 90,
                          width: 180,
                          child:  Card(
                            
                            color: appcolor,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: IconButton(icon: 
                              Icon(
                                Icons.check_box,
                                color: tap==false? Colors.black: Colors.white,
                                
                                ),
                              onPressed: (){
                                setState(() {
                                     tap = true;
                                });
                                
                              
                              },
                              ),
                              
                              title: AppTitle(widget.data[index].title.toString()),
                            // subtitle: AppSubTitle(widget.data[index].description.toString()),
                            trailing: ElevatedButton(onPressed: (){
                              // notesprovider.deleteNote(widget.data[index].id);
                              final snackBar = SnackBar(content: 
                              tap == false?
                              Text('please select the box first'):
                              Text('Task marked as done')
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }, child: Text('Mark as done')),
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