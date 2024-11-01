
import 'package:chat_app/widget/custom_text.dart';
import 'package:flutter/material.dart';

class CustomRowHeader extends StatelessWidget {
  const CustomRowHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios_rounded,color: Colors.white,)),
        ),
        const SizedBox(width: 30,),
        const Center(
          child: CustomText('Welcome!', fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white,),
        )
      ],
    );
  }
}
