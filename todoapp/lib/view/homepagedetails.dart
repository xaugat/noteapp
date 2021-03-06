import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:todoapp/common_widgets/completedtasklistview.dart';
import 'package:todoapp/common_widgets/normaltitle.dart';
import 'package:todoapp/common_widgets/subtitlewidget.dart';
import 'package:todoapp/common_widgets/tasklistview.dart';
import 'package:todoapp/common_widgets/titlewidgets.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/db_services/notedb.dart';
import 'package:todoapp/model/note_model.dart';
import 'dart:math';

import 'package:todoapp/viewmodel/notesprovider.dart';

class HomePageDetails extends StatefulWidget {
  const HomePageDetails({Key? key}) : super(key: key);

  @override
  _HomePageDetailsState createState() => _HomePageDetailsState();
}

class _HomePageDetailsState extends State<HomePageDetails> {

  // var notesProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // insertData();
    // getProvider();
  Provider.of<NotesProvider>(context, listen: false).getDatabase();
   
  }



 




  @override
  Widget build(BuildContext context) {
  
    return Consumer<NotesProvider>(builder: (context, provider, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                  color: appcolor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 26,
                          backgroundImage: AssetImage(
                            'saugat.jpg',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTitle('Hello Saugat !'),
                          AppSubTitle('How you doing today?')
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          
              const SizedBox(
                    height: 20,
                  ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       NormalTitle('All Task'),
                       const Icon(Icons.pending, color: appcolor,),
                     ],
                   ),
                 ),
               
                 TaskListView(provider.noteDb),
          
          
                
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       NormalTitle('Completed Task'),
                       const Icon(Icons.done, color: appcolor,),
                     ],
                   ),
                 ),
                      CompletedTaskListView(provider.noteDb),
          ],
        ),
      );
      
    }
    );
  }
}
