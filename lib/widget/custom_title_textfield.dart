
import 'package:chat_app/models/color&logo.dart';
import 'package:chat_app/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTitleTextField extends StatelessWidget {
  const CustomTitleTextField({
    super.key,
    required this.text
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return  Align(
     alignment: Alignment.topLeft,
     child:  Padding(
         padding: const EdgeInsets.only(left: 15,bottom: 10,top: 15),
         child:  CustomText(text,color: ColorsApp.primaryColor,fontSize: 20,fontWeight: FontWeight.bold,),
       ),
       );
  }
}