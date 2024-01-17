import 'package:flutter/material.dart';
import 'package:flutter_yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola mundo', fromWho: FromWho.mine),
    Message(text: 'Hola mundo?', fromWho: FromWho.mine),
    Message(text: 'Hola mundo', fromWho: FromWho.hers),
  ];

  Future<void> sendMessage(String message) async {
    if (message.isEmpty) return;
    final newMessage = Message(text: message, fromWho: FromWho.mine);
    messageList.add(newMessage);

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
