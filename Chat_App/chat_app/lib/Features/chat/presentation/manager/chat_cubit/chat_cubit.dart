import 'package:chat_app/Features/chat/data/models/message.dart';
import 'package:chat_app/Features/chat/presentation/manager/chat_cubit/chat_states.dart';
import 'package:chat_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  List<Message> messagesList = [];
  void sendMessage({required String message, Object? email}) {
    messages.add({'message': message, kCreatedAt: DateTime.now(), 'id': email});
  }

  void getMessages() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messages: messagesList));
    });
  }
}
