import 'package:chat_app/models/color&logo.dart';
import 'package:flutter/material.dart';

class CustomTextFields extends StatefulWidget {
  const CustomTextFields({
    super.key,
    required  this.controller,
    required this.text,
    this.iconSuf,
    this.iconSuf1,
  });

  final TextEditingController controller;
  final String text;
  final IconData? iconSuf;
  final IconData? iconSuf1;

  @override
  State<CustomTextFields> createState() => _CustomTextFieldsState();
}

class _CustomTextFieldsState extends State<CustomTextFields> {
  bool isObscured = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370,
      height: 50,
      child: TextFormField(
              cursorColor:  ColorsApp.primaryColor,
              controller:widget.controller,
              obscureText: isObscured,
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
              hintText: widget.text,
              hintStyle: const TextStyle(color: Colors.grey,fontSize: 15,),
              suffixIcon: IconButton(
                              icon: Icon(
                                  isObscured
                                      ? widget.iconSuf
                                      : widget.iconSuf1,
                                  color: ColorsApp.primaryColor),
                              onPressed: () {
                                 setState(() {
                                   isObscured =! isObscured;
                                 });
                              },
                            ),
       ),
      ),
    );
  }
}
