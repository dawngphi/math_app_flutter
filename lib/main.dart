import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/src/blocs/user_profile_bloc/profile_bloc.dart';
import 'package:math_app/src/models/lesson_node_model.dart';
import 'package:math_app/src/pages/create_profile_pages/create_profile_age_page.dart';
import 'package:math_app/src/pages/create_profile_pages/create_profile_gender_page.dart';
import 'package:math_app/src/pages/create_profile_pages/create_profile_notify_page.dart';
import 'package:math_app/src/pages/create_profile_pages/create_profile_splash_page.dart';
import 'package:math_app/src/pages/home_pages/home_page.dart';
import 'package:math_app/src/pages/language_pages/language_page.dart';
import 'package:math_app/src/pages/splash_pages/splash_page.dart';
import 'package:math_app/src/pages/test_pages/test_page.dart';
import 'package:math_app/src/pages/time_table_pages/time_table_page.dart';

void main() {
  runApp(BlocProvider(create: (_) => ProfileBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home: TestPage(),
        );
      },
    );
  }
}
