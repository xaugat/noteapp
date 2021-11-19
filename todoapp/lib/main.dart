import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/view/homepage.dart';
import 'package:todoapp/viewmodel/notesprovider.dart';

void main() {

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
    
   MyApp({Key? key}) : super(key: key);
  final notesProvider = NotesProvider();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> notesProvider,)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

