// ignore_for_file: unused_local_variable

import 'package:chat_app/Features/authentication/presentation/manager/register_cubit/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errMessage: 'weak password'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errMessage: 'email already exists'));
      }
    } catch (e) {
      emit(
          RegisterFailure(errMessage: 'there was an error , please try again'));
    }
  }
}
