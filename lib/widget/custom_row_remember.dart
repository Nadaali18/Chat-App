import 'package:chat_app/widget/color.dart';
import 'package:chat_app/widget/custom_text.dart';
import 'package:flutter/material.dart';
class CustomRowRemember extends StatefulWidget {
  const CustomRowRemember({super.key,required this.text1,this.text2});
final String text1;
final String? text2;
  @override
  State<CustomRowRemember> createState() => _CustomRowRememberState();
}

class _CustomRowRememberState extends State<CustomRowRemember> {
bool isChecked =false;

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   const SizedBox(width: 10,),
                   Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                           isChecked=value!;
                        });
                        },
                      activeColor:  ColorsApp.primaryColor,
                      shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                      side: const BorderSide(
                                  color: ColorsApp.primaryColor,
                                  width: 2,
                                ),
                    ),                          
                    CustomText(widget.text1, color:  ColorsApp.primaryColor, fontWeight: FontWeight.bold,),
                  ],
                  ),
                   Padding(
                      padding: const EdgeInsets.only(right: 27,),
                      child: CustomText(widget.text2, color:  ColorsApp.primaryColor, fontWeight: FontWeight.bold,),
                      ),
                      ],
                    );
  }
}
