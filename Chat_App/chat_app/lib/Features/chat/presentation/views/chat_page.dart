import 'package:chat_app/Features/chat/presentation/views/widgets/chat_page_body.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static const String id = 'chat page';
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 50,
            ),
            const Text('Chat'),
          ],
        ),
        centerTitle: true,
      ),
      body: ChatPageBody(
        email: email,
      ),
    );
  }
}
