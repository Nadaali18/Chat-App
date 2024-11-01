
import 'package:chat_app/widget/color.dart';
import 'package:chat_app/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.text
  });
 final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                   // LogIn;
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  ColorsApp.primaryColor,
                    minimumSize: const Size(370, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: CustomText(
                    text,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            );
  }
}
