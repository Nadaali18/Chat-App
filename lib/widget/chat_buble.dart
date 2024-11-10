import 'package:chat_app/widget/color.dart';
import 'package:chat_app/widget/custom_text.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(32),topRight: Radius.circular(32),bottomRight: Radius.circular(32)),
          color: ColorsApp.primaryColor,
        ),
        child: const CustomText('Hi i am nada',color: Colors.white,),
      ),
    );
  }
}