import 'package:flutter/material.dart';
import 'package:todoapp/common_widgets/subtitlewidget.dart';
import 'package:todoapp/common_widgets/titlewidgets.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/model/note_model.dart';
class TaskListView extends StatelessWidget {
  List<NoteModel> data;
  TaskListView(this.data, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data);
    return  Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  
                  scrollDirection: Axis.horizontal,
                  itemCount: data == null? 0: data.length,
                  itemBuilder: (BuildContext context, index){
                    return  Container(
                      height: 180,
                      width: 180,
                      child:  Card(color: appcolor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTitle(data[index].title.toString()),
                            AppSubTitle(data[index].description.toString()),
                            Text(data[index].done == 0? 'pending': 'done')
                            
                          ],
                        ),
                      ),
                      ),
                    );

                  },
                  ),
              );
  }
}