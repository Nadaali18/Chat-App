import 'package:chat_app/cubit/login/login_cubit.dart';
import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/sign_up_screen.dart';
import 'package:chat_app/models/color&logo.dart';
import 'package:chat_app/widget/custom_buttom.dart';
import 'package:chat_app/widget/custom_row_header.dart';
import 'package:chat_app/widget/custom_text.dart';
import 'package:chat_app/widget/custom_textfields.dart';
import 'package:chat_app/widget/custom_title.dart';
import 'package:chat_app/widget/custom_title_textfield.dart';
import 'package:chat_app/widget/custom_row_navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
    LoginScreen({super.key});
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
           if(state is LoginSuccess ){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(email: emailController.text)));
           }else if(state is LoginLoading){
            Center(child: CircularProgressIndicator(),);
           }else if(state is LoginFailure){
            SnackBar(content: CustomText(state.errorMessage));
           }
      },
      builder:(context,state) => Scaffold(
        backgroundColor: ColorsApp.primaryColor,
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 150,
              width: double.infinity,
              child: CustomRowHeader(),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.68),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const CustomTitle(text: 'Log In'),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomTitleTextField(text: 'Email'),
                      CustomTextFields(
                        controller: emailController,
                        text: 'Enter Your Email',
                      ),
                      const CustomTitleTextField(text: 'Password'),
                     CustomTextFields(
                      controller: passwordController, text: 'Enter Your Password',
                      iconSuf: Icons.visibility_off,
                      iconSuf1: Icons.visibility,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButtom(text: 'Log in',function:() async{
                         BlocProvider.of<LoginCubit>(context).LogIn(email: emailController.text, password: passwordController.text);
                      },),
                      CustomRowNavigate(
                        text2: 'dont have an account?',
                        text3: 'Sign Up',
                        widget1: LoginScreen(),
                        widget2: SignUpScreen(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
