import 'package:flutter/material.dart';
// ignore: must_be_immutable
class AppTitle extends StatelessWidget {
  String title;
  
  AppTitle(this.title, {Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return  Text(
      title, style:const TextStyle(color:Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}