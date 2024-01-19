import 'package:flutter/material.dart';
import 'package:flutter_yes_no_app/domain/entities/message.dart';
import 'package:flutter_yes_no_app/presentation/providers/chat_provider.dart';
import 'package:flutter_yes_no_app/presentation/widgets/chats/her_message_bubble.dart';
import 'package:flutter_yes_no_app/presentation/widgets/chats/my_message_bubble.dart';
import 'package:flutter_yes_no_app/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://media-gua1-1.cdn.whatsapp.net/v/t61.24694-24/401030549_201477673006627_5323670420079214227_n.jpg?ccb=11-4&oh=01_AdQborfrqpx8yCOTEc6Vl9dSPfBqjLhaiC6TAZVfqY7DOA&oe=65B42848&_nc_sid=e6ed6c&_nc_cat=111'),
          ),
        ),
        title: const Text('Anielka'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child:
                  //Container(color:Colors.amber)
                  ListView.builder(
                    controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (BuildContext context, int index) {
                  final message = chatProvider.messageList[index];
                  return (message.fromWho == FromWho.mine)
                      ? MyMessageBubble(message: message)
                      : HerMessageBubble(message: message); //Text('Indice $index') ;
                },
              ),
            ),
            MessageFieldBox(
              //onValue: (value) {  chatProvider.SendMessage(value);  },
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
