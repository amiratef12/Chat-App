// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/Features/authentication/presentation/manager/login_cubit/login_cubit.dart';
import 'package:chat_app/Features/authentication/presentation/manager/login_cubit/login_state.dart';
import 'package:chat_app/Features/authentication/presentation/views/register_page.dart';
import 'package:chat_app/Features/authentication/presentation/views/widgets/custom_button.dart';
import 'package:chat_app/Features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:chat_app/Features/chat/presentation/manager/chat_cubit/chat_cubit.dart';
import 'package:chat_app/Features/chat/presentation/views/chat_page.dart';
import 'package:chat_app/core/utils/functions/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HomeLoginPageBody extends StatefulWidget {
  const HomeLoginPageBody({super.key});

  @override
  State<HomeLoginPageBody> createState() => _HomeLoginPageBodyState();
}

class _HomeLoginPageBodyState extends State<HomeLoginPageBody> {
  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  String? email;

  String? password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            isLoading = true;
          } else if (state is LoginSuccess) {
            BlocProvider.of<ChatCubit>(context).getMessages();
            Navigator.pushNamed(context, ChatPage.id, arguments: email);
            isLoading = false;
          } else if (state is LoginFailure) {
            showSnackBar(context, state.errMessage);
            isLoading = false;
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  Image.asset(
                    'assets/images/scholar.png',
                    height: 100,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scholar Chat',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontFamily: 'Pacifico'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  const Row(
                    children: [
                      Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'Email'),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                      obscureText: true,
                      onChanged: (data) {
                        password = data;
                      },
                      hintText: 'Password'),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context)
                            .loginUser(email: email!, password: password!);
                      }
                    },
                    text: 'LOGIN',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'dont have an account ?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterPage.id);
                        },
                        child: const Text(
                          ' Register',
                          style: TextStyle(color: Color(0XFFc4e8e9)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
