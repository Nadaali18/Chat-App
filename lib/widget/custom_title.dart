
import 'package:chat_app/widget/color.dart';
import 'package:chat_app/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.text
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomText(
        text,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color:  ColorsApp.primaryColor,
      ),
    );
  }
}