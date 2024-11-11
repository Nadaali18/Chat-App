import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/color&logo.dart';
import 'package:chat_app/widget/custom_text.dart';
import 'package:flutter/material.dart';

class ChatBubleFriend extends StatelessWidget {
  const ChatBubleFriend({
    super.key,
    required this.message
  });
final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration:  BoxDecoration(
          borderRadius:const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
          color: ColorsApp.primaryColor,
        ),
        child:  CustomText(message.message,color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
      ),
    );
  }
}