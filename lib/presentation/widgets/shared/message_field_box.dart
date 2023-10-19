import 'package:flutter/material.dart';

class MessageInputField extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageInputField({super.key, required this.onValue});

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
              textcontroller.clear();
              onValue(text_value);

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

        textcontroller.clear();
        focusnode.requestFocus();
        onValue(values);

      },
      onChanged: (value){
      },

    );
  }
}