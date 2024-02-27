import 'package:chat_app/Features/chat/presentation/manager/chat_cubit/chat_cubit.dart';
import 'package:chat_app/Features/chat/presentation/manager/chat_cubit/chat_states.dart';
import 'package:chat_app/Features/chat/presentation/views/widgets/chat_bubble.dart';
import 'package:chat_app/Features/chat/presentation/views/widgets/chat_bubble_for_friend.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPageBody extends StatefulWidget {
  const ChatPageBody({super.key, required this.email});
  final Object? email;

  @override
  State<ChatPageBody> createState() => _ChatPageBodyState();
}

class _ChatPageBodyState extends State<ChatPageBody> {
  TextEditingController controller = TextEditingController();

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              var messagesList =
                  BlocProvider.of<ChatCubit>(context).messagesList;
              return ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    return messagesList[index].id == widget.email
                        ? ChatBubble(
                            message: messagesList[index],
                          )
                        : ChatBubbleForFriend(message: messagesList[index]);
                  });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: controller,
            onSubmitted: (data) {
              BlocProvider.of<ChatCubit>(context)
                  .sendMessage(message: data, email: widget.email);
              controller.clear();
              _controller.animateTo(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            },
            decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: const Icon(
                  Icons.send,
                  color: kPrimaryColor,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: kPrimaryColor))),
          ),
        )
      ],
    );
  }
}
