import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_app/src/blocs/user_profile_bloc/profile_bloc.dart';
import 'package:math_app/src/pages/create_profile_pages/create_profile_age_page.dart';
import 'package:math_app/src/pages/create_profile_pages/create_profile_gender_page.dart';
import 'package:math_app/src/pages/create_profile_pages/create_profile_notify_page.dart';
import 'package:math_app/src/pages/create_profile_pages/create_profile_splash_page.dart';
import 'package:math_app/src/pages/home_pages/home_page.dart';
import 'package:math_app/src/pages/splash_pages/splash_page.dart';

void main() {
  runApp(BlocProvider(
    create: (_) => ProfileBloc(),
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  CreateProfileSplashPage(),
    );
  }
}