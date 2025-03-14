import 'package:chat_app/cubit/chat/chat_cubit.dart';
import 'package:chat_app/cubit/login/login_cubit.dart';
import 'package:chat_app/cubit/register/register_cubit.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/screens/auth.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
     DevicePreview(
       enabled: !kReleaseMode,
       builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>LoginCubit()),
        BlocProvider(create: (contex)=>RegisterCubit()),
        BlocProvider(create: (contex)=>ChatCubit()),
      ],
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        home: Auth(),
      ),
    );
  }
}
