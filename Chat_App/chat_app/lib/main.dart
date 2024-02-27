import 'package:chat_app/Features/authentication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:chat_app/Features/authentication/presentation/manager/register_cubit/register_cubit.dart';
import 'package:chat_app/Features/authentication/presentation/views/home_login_page.dart';
import 'package:chat_app/Features/authentication/presentation/views/register_page.dart';
import 'package:chat_app/Features/chat/presentation/manager/chat_cubit/chat_cubit.dart';
import 'package:chat_app/Features/chat/presentation/views/chat_page.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => ChatCubit())
      ],
      child: MaterialApp(
        routes: {
          ChatPage.id: (context) => const ChatPage(),
          RegisterPage.id: (context) => const RegisterPage(),
          HomeLoginPage.id: (context) => const HomeLoginPage()
        },
        debugShowCheckedModeBanner: false,
        initialRoute: HomeLoginPage.id,
      ),
    );
  }
}
