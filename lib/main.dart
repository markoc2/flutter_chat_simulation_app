import 'package:flutter/material.dart';
import 'package:flutter_yes_no_app/config/theme/app_theme.dart';
import 'package:flutter_yes_no_app/presentation/screens/chats/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Yes No App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor:5, selectedBrightness: Brightness.light).theme(),
      home: const ChatScreen()
    );
  }
}