import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/sign_up_screen.dart';
import 'package:chat_app/widget/color.dart';
import 'package:chat_app/widget/custom_buttom.dart';
import 'package:chat_app/widget/custom_row_header.dart';
import 'package:chat_app/widget/custom_row_remember.dart';
import 'package:chat_app/widget/custom_textfields.dart';
import 'package:chat_app/widget/custom_title.dart';
import 'package:chat_app/widget/custom_title_textfield.dart';
import 'package:chat_app/widget/custom_row_navigate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscured = true;
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
 
 void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }
  
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
Future LogIn() async{
  await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
  Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage()));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  ColorsApp.primaryColor,
      body: Column(
        children: [
          const SizedBox(height: 30,),
          const SizedBox(
            height: 150,
            width: double.infinity,
            child: CustomRowHeader(),
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.68),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomTitle(text: 'Log In'),
                    const CustomTitleTextField(text: 'Email'),
                    CustomTextFields(controller: _emailController,text: 'Enter Your Email',),
                    const CustomTitleTextField(text: 'Password'),
                  
                     SizedBox(
                      width: 370,
                      height: 50,
                      child: TextFormField(
                               cursorColor:  ColorsApp.primaryColor,
                               controller: _passwordController,
                               obscureText: _isObscured,
                               decoration: InputDecoration(
                                            filled: true,
                                            fillColor: const Color.fromARGB(255, 237, 236, 236),
                                            enabledBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(15),
                                                            borderSide: const BorderSide(color: Colors.transparent)
                                                          ),
                                            focusedBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(15),
                                                            borderSide: const BorderSide(color: ColorsApp.primaryColor)
                                                          ),
                                            hintText:  'Enter Your Password',
                                            hintStyle: const TextStyle(color: Colors.grey,fontSize: 15,),
                                            suffixIcon: IconButton(
                                                         icon: Icon(
                                                                _isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                                                color: ColorsApp.primaryColor
                                                        ),
                                                          onPressed: _togglePasswordVisibility,
                                                        ),
                                          ),
                             ),
                      ),
                      const CustomRowRemember(text1: 'Remember me',text2: 'Forgot Password?',),
                      CustomButtom(text: 'Log in',function: LogIn,),
                      const CustomRowNavigate(
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
    );
  }
}
