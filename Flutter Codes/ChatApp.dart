import 'package:leaf_check/chat_api.dart';
import 'package:leaf_check/chat_page.dart';
import 'package:flutter/material.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({required this.chatApi, super.key});

  final ChatApi chatApi;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatGPT Client',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          secondary: Colors.blueGrey,
        ),
      ),
      home: ChatPage(chatApi: chatApi),
      debugShowCheckedModeBanner: false,
    );
  }
}
