
import 'package:chat_app/widget/color.dart';
import 'package:chat_app/widget/custom_text.dart';
import 'package:flutter/material.dart';
class CustomRowNavigate extends StatefulWidget {
  const CustomRowNavigate({super.key,required this.text2,required this.text3,required this.widget1,required this.widget2});
final String text2;
final String text3;
final Widget widget1;
final Widget widget2;

  @override
  State<CustomRowNavigate> createState() => _CustomRowNavigateState();
}

class _CustomRowNavigateState extends State<CustomRowNavigate> {



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30,bottom: 30),
            child: CustomText(widget.text2, color: ColorsApp.primaryColor,),
          ),
      
             GestureDetector(
              onTap: () { 
                Navigator.push(context,MaterialPageRoute(builder: (context)=>widget.widget2));
                },
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 30,bottom: 30),
                child: CustomText(widget.text3,color: ColorsApp.primaryColor,fontWeight: FontWeight.bold,),
              )
              ),
        
        ],
      ),
    );
  }
}
