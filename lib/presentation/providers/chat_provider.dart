import 'package:flutter/material.dart';
import 'package:flutter_yes_no_app/config/helpers/get_web_api.dart';
import 'package:flutter_yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetWebApiAnswers getWebApiAnswers = GetWebApiAnswers();

  List<Message> messageList = [
    Message(text: 'Hola mundo', fromWho: FromWho.mine)
  ];

  Future<void> sendMessage(String message) async {
    if (message.isEmpty) return;
    final newMessage = Message(text: message, fromWho: FromWho.mine);
    messageList.add(newMessage);

    if (message.endsWith('?')) {
      herReplay();
    }else{
      notifyListeners();
      moveScrollToBottom();
    }

    
  }

  Future<void> herReplay() async {
    final herMessage = await getWebApiAnswers.getAnswers();
    messageList.add(herMessage);

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
