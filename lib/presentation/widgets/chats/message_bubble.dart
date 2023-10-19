import 'package:flutter/material.dart';
import 'package:question_app/domain/entyties/message.dart';


class MyMessage extends StatelessWidget {
  final Message message;
  const MyMessage({super.key, required  this.message});

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
            child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal:20.0,vertical: 10),
          child: Text(message.text),
        ),
        ),
        
        const SizedBox(height: 10,),
        
      ],
    );
  }
}