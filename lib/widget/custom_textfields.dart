import 'package:chat_app/widget/color.dart';
import 'package:flutter/material.dart';

class CustomTextFields extends StatelessWidget {
  const CustomTextFields({
    super.key,
    required  this.controller,
    required this.text,
 
  });

  final TextEditingController controller;
  final String text;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370,
      height: 50,
      child: TextFormField(
              cursorColor:  ColorsApp.primaryColor,
              controller:controller,
              decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 237, 236, 236),
              enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.transparent)
              ),
              focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: ColorsApp.primaryColor)
                            ),
              hintText: text,
              hintStyle: const TextStyle(color: Colors.grey,fontSize: 15,),
         
       ),
      ),
    );
  }
}
