import 'package:flutter/material.dart';
import 'package:todoapp/common_widgets/subtitlewidget.dart';
import 'package:todoapp/common_widgets/titlewidgets.dart';
import 'package:todoapp/constants/colors.dart';
class TaskListView extends StatelessWidget {
  String title;
  String subtitle;
  TaskListView(this.title, this.subtitle,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
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
                            AppTitle('title'),
                            AppSubTitle('subtitle'),
                            
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