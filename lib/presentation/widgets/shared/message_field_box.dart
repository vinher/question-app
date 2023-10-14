import 'package:flutter/material.dart';

class MessageInputField extends StatelessWidget {
  const MessageInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final textcontroller = TextEditingController();
    final FocusNode focusnode = FocusNode();

    final outlineinputborder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );

    final input_decoration = InputDecoration(
        hintText: "Se nd Your Message",
        enabledBorder: outlineinputborder,
        focusedBorder: outlineinputborder,
        filled: true,
        suffixIcon: IconButton(
          icon:const Icon(Icons.send_outlined),
          onPressed: (){
            final text_value = textcontroller.value.text;
              print("Valor De La Caja De Texto $text_value");
              textcontroller.clear();

          },
          ),

      );

    return TextFormField(
      onTapOutside: (event){
        focusnode.unfocus();
      },
      focusNode: focusnode,
      controller: textcontroller,
      decoration: input_decoration,
      onFieldSubmitted: (values){
        print("Values:  $values");
        textcontroller.clear();
        focusnode.requestFocus();

      },
      onChanged: (value){
         print("Values 2:  $value");
      },

    );
  }
}