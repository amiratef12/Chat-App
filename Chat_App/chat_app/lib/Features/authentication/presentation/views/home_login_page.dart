import 'package:chat_app/Features/authentication/presentation/views/widgets/home_login_page_body.dart';
import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class HomeLoginPage extends StatelessWidget {
  const HomeLoginPage({super.key});
  static String id = 'login page';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: HomeLoginPageBody(),
    );
  }
}
