import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/src/blocs/language_bloc/language_bloc.dart';
import 'package:math_app/src/blocs/language_bloc/language_event.dart';
import 'package:math_app/src/blocs/language_bloc/language_state.dart';
import 'package:math_app/src/blocs/user_profile_bloc/profile_bloc.dart';
import 'package:math_app/src/blocs/user_profile_bloc/profile_event.dart';
import 'package:math_app/src/database/user_database.dart';
import 'package:math_app/src/models/user_profile_model.dart';
import 'package:math_app/src/pages/home_pages/home_page.dart';
import 'package:math_app/src/routes/routes.dart';

import 'l10n/app_localizations.dart';



Locale getLocaleFromIndex(int index) {
  switch (index) {
    case 1:
      return const Locale('vi');
    case 0:
    default:
      return const Locale('en');
  }
}
Future<UserProfileModel?> getInitialUser() async {
  return await UserDatabase.instance.getFirstUser();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final user = await getInitialUser();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
          create: (_) {
            final bloc = ProfileBloc();
            if (user != null) {
              bloc.add(LoadUserProfile(user));
            }
            return bloc;
          },
        ),
        BlocProvider<LanguageBloc>(
          create: (_) => LanguageBloc()..add(LoadLanguageEvent()),
        ),
      ],
      child: MyApp(initialUser: user),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserProfileModel? initialUser;
  const MyApp({super.key, this.initialUser});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            return MaterialApp(
              locale: getLocaleFromIndex(state.selectedIndex),
              supportedLocales: const [
                Locale('en', ''),
                Locale('vi', ''),
              ],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              title: 'Math App',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                fontFamily: 'Fredoka',
              ),
              initialRoute: initialUser != null
                  ? AppRoutes.splash
                  : AppRoutes.createProfileGender,
              routes: AppRoutes.routes,
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
