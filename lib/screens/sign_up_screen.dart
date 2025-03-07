import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/models/color&logo.dart';
import 'package:chat_app/widget/custom_buttom.dart';
import 'package:chat_app/widget/custom_row_header.dart';
import 'package:chat_app/widget/custom_textfields.dart';
import 'package:chat_app/widget/custom_title.dart';
import 'package:chat_app/widget/custom_title_textfield.dart';
import 'package:chat_app/widget/custom_row_navigate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 bool _isObscured= true;
   final _emailController=TextEditingController();
   final _passwordController=TextEditingController();
   final _userNameController=TextEditingController();
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
  Future<dynamic> SignUp()  async{
     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
     print("Account created: ${userCredential.user?.email}");
     Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(email: _emailController.text.trim(),)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.primaryColor,
      body: Column(
        children: [
          const SizedBox(height: 40,),
          const SizedBox(
            height: 150,
            width: double.infinity,
            child: CustomRowHeader(),
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.68),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomTitle(text: 'Sign Up',),
                    const SizedBox(height: 20,),
                    Column(
                    children: [
                    const CustomTitleTextField(text: 'UserName'),
                    CustomTextFields(controller: _userNameController, text: 'Enter Your Name'),          
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
                                        ],
                                       ),
                    const SizedBox(height: 20,),
                    CustomButtom(text: 'Sign up',function: SignUp,),
                    CustomRowNavigate(
                      text2: 'already have an account?',
                      text3: 'Log In',
                      widget1: const SignUpScreen(),
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
  }
}

