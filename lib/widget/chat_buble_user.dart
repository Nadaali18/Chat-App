import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/models/color&logo.dart';
import 'package:chat_app/widget/custom_text.dart';
import 'package:flutter/material.dart';

class ChatBubleUser extends StatelessWidget {
  const ChatBubleUser({
    super.key,
    required this.message
  });
final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
          color: ColorsApp.secondColor,
        ),
        child:  CustomText(message.message,color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
      ),
    );
  }
}