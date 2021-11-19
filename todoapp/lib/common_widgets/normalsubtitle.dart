import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
// ignore: must_be_immutable
class NormalSubTitle extends StatelessWidget {
  String title;
  
  NormalSubTitle(this.title, {Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return  Text(
      title, style:const TextStyle(color:appcolor, fontSize: 16),
    );
  }
}