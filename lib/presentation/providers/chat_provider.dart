import 'package:flutter/material.dart';
import 'package:question_app/config/helpers/yes_no_answer.dart';
import 'package:question_app/domain/entyties/message.dart';
import 'package:question_app/presentation/widgets/chats/her_messages.dart';

class ChatProvider extends ChangeNotifier{
  final GetYesNoanswer getYesNoAnswer = GetYesNoanswer();

  final ScrollController chatScrollController = ScrollController();

  List<Message> message = [
    Message(text:'Hello', fromWho:FromWho.mine),
    Message(text:'Hi!!', fromWho:FromWho.hers)
  ];

  Future<void> sendMessage(String text) async {
    if(text.isEmpty)return;
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    message.add(newMessage);

    if(text.endsWith('?')){
       herReply();

    }



    notifyListeners();
    moveScrollToBottom();
  }

  Future<void>herReply()async{
    final herMessage = await getYesNoAnswer.getAnswer();
    message.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

Future <void> moveScrollToBottom() async{
  await Future.delayed(const Duration(milliseconds: 100));
  chatScrollController.animateTo(
    chatScrollController.position.maxScrollExtent, 
    duration: const Duration(milliseconds: 300), 
    curve: Curves.easeInOut);
 
}

}

