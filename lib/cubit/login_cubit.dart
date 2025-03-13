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
  }on FirebaseAuthException catch(e){
     if(e.code == 'user-not-found'){
      emit(LoginFailure(errorMessage: 'User not Found'));
     }else if (e.code == 'wrong-password'){
      emit(LoginFailure(errorMessage: 'Wrong Password'));
     }
  }
  catch(e){
    emit(LoginFailure(errorMessage: 'Something went wrong'));
  }
}
  
}
