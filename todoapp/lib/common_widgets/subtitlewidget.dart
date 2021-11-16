import 'package:flutter/material.dart';
// ignore: must_be_immutable
class AppSubTitle extends StatelessWidget {
  String title;
  
  AppSubTitle(this.title,{Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return  Text(
      title, style:const TextStyle(color: Colors.white, fontSize: 16),
    );
  }
}