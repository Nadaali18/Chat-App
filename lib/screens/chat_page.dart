import 'package:chat_app/widget/chat_buble.dart';
import 'package:chat_app/widget/color.dart';
import 'package:chat_app/widget/custom_text.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsApp.primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset(logo,height: 60,),
             const CustomText(
              'Chat',
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        centerTitle: true,
          ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder:(context,index)=> const ChatBuble(),),
          ),
         Padding(
           padding: const EdgeInsets.all(16),
           child: TextField(
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.send_rounded,color: ColorsApp.primaryColor,)),
              ),
              enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: ColorsApp.primaryColor)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: ColorsApp.primaryColor)
            )
            ),
           ),
         ), 
          ]
        ,
      ),    
    );
  }
}
