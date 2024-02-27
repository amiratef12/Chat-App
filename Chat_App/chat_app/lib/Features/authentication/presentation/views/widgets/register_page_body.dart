// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/Features/authentication/presentation/manager/register_cubit/register_cubit.dart';
import 'package:chat_app/Features/authentication/presentation/manager/register_cubit/register_state.dart';
import 'package:chat_app/Features/authentication/presentation/views/widgets/custom_button.dart';
import 'package:chat_app/Features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:chat_app/Features/chat/presentation/views/chat_page.dart';
import 'package:chat_app/core/utils/functions/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPageBody extends StatefulWidget {
  const RegisterPageBody({super.key});

  @override
  State<RegisterPageBody> createState() => _RegisterPageBodyState();
}

class _RegisterPageBodyState extends State<RegisterPageBody> {
  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  String? email;

  String? password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            isLoading = true;
          } else if (state is RegisterSuccess) {
            Navigator.pushNamed(context, ChatPage.id);
            isLoading = false;
          } else if (state is RegisterFailure) {
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
                        'REGISTER',
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
                        BlocProvider.of<RegisterCubit>(context)
                            .registerUser(email: email!, password: password!);
                      }
                    },
                    text: 'REGISTER',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'already have an account ?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          ' Login',
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
