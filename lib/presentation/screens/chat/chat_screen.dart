import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:question_app/domain/entyties/message.dart';
import 'package:question_app/presentation/providers/chat_provider.dart';
import 'package:question_app/presentation/widgets/chats/her_messages.dart';
import 'package:question_app/presentation/widgets/chats/message_bubble.dart';
import 'package:question_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat 1") , 
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://static.vecteezy.com/system/resources/previews/008/442/086/non_2x/illustration-of-human-icon-user-symbol-icon-modern-design-on-blank-background-free-vector.jpg"),
          ),),
          ),
          body:  _ChatView(),
          
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:10.0),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.message.length,
              itemBuilder:(context, index){
                final message = chatProvider.message[index];
                return (message.fromWho == FromWho.hers) ? HerMessage() : MyMessage(message:message);
            })),
             MessageInputField(
              onValue:chatProvider.sendMessage,
             )
          
          ],
        ),
      ),
      
    );
  }
}