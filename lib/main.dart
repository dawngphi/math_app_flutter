import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/src/blocs/user_profile_bloc/profile_bloc.dart';
import 'package:math_app/src/pages/duel_pages/duel_pages_2/duel_page_2.dart';
import 'package:math_app/src/pages/duel_pages/how_to_play_page.dart';

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
          home: DuelPage2(),
        );
      },
    );
  }
}
