import 'package:chat_app/Features/authentication/presentation/views/widgets/register_page_body.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static String id = 'register page';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: RegisterPageBody(),
    );
  }
}
