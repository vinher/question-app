import 'package:flutter/material.dart';


class MyMessage extends StatelessWidget {
  const MyMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration:  BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20)
            ),
            child:const Padding(
          padding:  EdgeInsets.symmetric(horizontal:20.0,vertical: 10),
          child: Text("lorem ipsum dolor sit amet"),
        ),
        ),
        
        const SizedBox(height: 10,),
        
      ],
    );
  }
}

