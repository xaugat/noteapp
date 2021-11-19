import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';
import 'package:todoapp/common_widgets/normaltitle.dart';
import 'package:todoapp/common_widgets/titlewidgets.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/viewmodel/notesprovider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
class AddNotesPage extends StatefulWidget {
  const AddNotesPage({ Key? key }) : super(key: key);

  @override
  _AddNotesPageState createState() => _AddNotesPageState();
}

class _AddNotesPageState extends State<AddNotesPage> {

   String datevalue = 'Select date and time';

   TextEditingController noteTitleController = TextEditingController();
   TextEditingController noteDescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     final notesProvider = context.watch<NotesProvider>();
    return Column(
    
      children: [
         const SizedBox(height: 20,),
        Center(
          child:  NormalTitle('Add a new notes'),

        ),
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: appcolor,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: noteTitleController,
                        decoration: InputDecoration(hintText: 'enter note title..'),
                      ),
                    )),
                  Container(
                    height: 200,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                            controller: noteDescController,
                          keyboardType: TextInputType.multiline,
  maxLines: 10,
                        decoration: InputDecoration(hintText: 'enter note detail..'),
                      ),
                    )),
                    const SizedBox(height: 10,),
                    AppTitle('Reminder date'),
                      const SizedBox(height: 10,),
                   Container(
                     width: MediaQuery.of(context).size.width,
                     height: 50,
                     child: Card(
                          child: Center(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(datevalue),
                              IconButton(icon: const Icon(Icons.date_range),
                              onPressed: (){

                            // String now = DateFormat("yyyy-MM-dd").format(DateTime.now());

    //                      final TimeOfDay? result =
    //     await showTimePicker(context: context, initialTime: TimeOfDay.now());
    //   final resultdate =  await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2200));
    // if (result != null) {
    //   setState(() {
         
    //     datevalue = resultdate.toString()+  result.format(context) ;
    //   });
    // }
                             
                                DatePicker.showDateTimePicker(context,
                                showTitleActions: true,
                                currentTime: DateTime.now(),
                                locale: LocaleType.en
                                
                                ).then((value) => {
                                  print(value.toString()),
                                   setState(() {
                                datevalue = value.toString();
                                   
                                }), 

                                
                                   
                                });

                              
                              },
                              
                              ),
                            ],
                          )),
                        ),
                   ),
                      const SizedBox(height: 20,),
                  
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      
                      onPressed: (){
                       notesProvider.insertData(noteTitleController.text, noteDescController.text,
                       datevalue.toString()
                       ); 


                      }, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Save'),
                          SizedBox(width: 10,),
                          Icon(Icons.save)
                        ],
                      )))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}