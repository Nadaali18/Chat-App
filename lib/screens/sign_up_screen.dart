import 'package:chat_app/cubit/register/register_cubit.dart';
import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/login_screen.dart';
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

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if(state is RegisterSuccess ){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(email: emailController.text)));
           }else if(state is RegisterLoading){
            Center(child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ColorsApp.primaryColor),),);
           }else if(state is RegisterFailure){
            SnackBar(content: CustomText(state.errorMessage));
           }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorsApp.primaryColor,
          body: Column(
            children: [
              const SizedBox(
                height: 40,
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
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.68),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const CustomTitle(
                          text: 'Sign Up',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            const CustomTitleTextField(text: 'UserName'),
                            CustomTextFields(
                                controller: userNameController,
                                text: 'Enter Your Name'),
                            const CustomTitleTextField(text: 'Email'),
                            CustomTextFields(
                              controller: emailController,
                              text: 'Enter Your Email',
                            ),
                            const CustomTitleTextField(text: 'Password'),
                            CustomTextFields(
                              controller: passwordController,
                              text: 'Enter Your Password',
                              iconSuf: Icons.visibility_off,
                              iconSuf1: Icons.visibility,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButtom(
                          text: 'Sign up',
                          function: () async {
                            BlocProvider.of<RegisterCubit>(context).SignUp(
                                email: emailController.text,
                                password: passwordController.text);
                          },
                        ),
                        CustomRowNavigate(
                          text2: 'already have an account?',
                          text3: 'Log In',
                          widget1: SignUpScreen(),
                          widget2: LoginScreen(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
