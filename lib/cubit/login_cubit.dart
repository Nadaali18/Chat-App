import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

Future LogIn({required String email,required String password}) async{
  emit(LoginLoading());
  try{
  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  emit(LoginSuccess());
  }catch(e){
    emit(LoginFailure());
  }
}
  
}
