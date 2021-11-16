import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
// ignore: must_be_immutable
class NormalTitle extends StatelessWidget {
  String title;
  
  NormalTitle(this.title, {Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return  Text(
      title, style:const TextStyle(color:appcolor, fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}